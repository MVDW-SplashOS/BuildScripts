#!/usr/bin/env python3
"""Render an xdg-utils desc/*.xml DocBook refentry as plain text.

Stands in for `xmlto txt`, which needs xmlto, the DocBook XSL stylesheets
and a text browser (lynx/w3m), none of which are packaged. The output only
feeds the --help/--manual text that generate-help-script.awk embeds into
each xdg-* script, so it follows the layout that script expects:

    Name
    <blank>
       xdg-foo - purpose
    <blank>
    Synopsis
    ...
    Description
    ...

Usage: docbook2txt.py desc/xdg-foo.xml > xdg-foo.txt
"""
import re
import sys
import textwrap
import xml.etree.ElementTree as ET

WIDTH = 72


def inline(el):
    """Flatten an element's inline content to a single line of text."""
    parts = [el.text or ""]
    for child in el:
        tag = child.tag
        if tag == "citerefentry":
            title = child.findtext("refentrytitle") or ""
            vol = child.findtext("manvolnum")
            parts.append(f"{title}({vol})" if vol else title)
        elif tag == "ulink":
            text = inline(child).strip()
            url = child.get("url", "")
            parts.append(f"{text} ({url})" if text and text != url else url)
        elif tag == "arg" or tag == "group":
            parts.append(synopsis_item(child))
        else:
            parts.append(inline(child))
        parts.append(child.tail or "")
    return re.sub(r"\s+", " ", "".join(parts))


def synopsis_item(el):
    """Render <arg>/<group> with DocBook's bracket conventions."""
    if el.tag == "group":
        items = [synopsis_item(c) if c.tag in ("arg", "group") else inline(c).strip()
                 for c in el]
        body = " | ".join(i for i in items if i)
    else:
        body = inline(el).strip()
    choice = el.get("choice", "opt")
    if choice == "opt":
        body = f"[{body}]"
    elif choice == "req":
        body = f"{{ {body} }}" if el.tag == "group" else body
    if el.get("rep") == "repeat":
        body += "..."
    return body


def wrap(text, indent):
    text = text.strip()
    if not text:
        return []
    return textwrap.wrap(text, WIDTH - indent, break_on_hyphens=False,
                         initial_indent=" " * indent, subsequent_indent=" " * indent) + [""]


def blocks(el, indent):
    """Render block-level children of el."""
    out = []
    if el.text and el.text.strip():
        out += wrap(el.text, indent)
    for child in el:
        tag = child.tag
        if tag in ("para", "simpara"):
            out += wrap(inline(child), indent)
        elif tag == "programlisting" or tag == "screen" or tag == "literallayout":
            lines = (child.text or "") + "".join(ET.tostring(c, encoding="unicode", method="text") for c in child)
            lines = lines.strip("\n").splitlines()
            out += [" " * indent + line.rstrip() for line in lines] + [""]
        elif tag == "variablelist":
            for entry in child.findall("varlistentry"):
                for term in entry.findall("term"):
                    out.append(" " * indent + inline(term).strip())
                item = entry.find("listitem")
                if item is not None:
                    out += blocks(item, indent + 4) or [""]
        elif tag in ("itemizedlist", "orderedlist"):
            for n, item in enumerate(child.findall("listitem"), 1):
                sub = blocks(item, indent + 3)
                mark = "*" if tag == "itemizedlist" else f"{n}."
                if sub:
                    sub[0] = " " * indent + mark.ljust(3) + sub[0].lstrip()
                out += sub
        elif tag in ("refsect2", "refsect3", "section"):
            title = child.findtext("title")
            if title:
                out += [" " * indent + re.sub(r"\s+", " ", title).strip(), ""]
            out += blocks(child, indent + 3)
        elif tag == "cmdsynopsis":
            out += wrap(synopsis(child), indent)
        elif tag == "title":
            continue
        else:
            text = inline(child)
            if text.strip():
                out += wrap(text, indent)
        if child.tail and child.tail.strip():
            out += wrap(child.tail, indent)
    return out


def synopsis(cmd):
    parts = []
    for child in cmd:
        if child.tag == "command":
            parts.append(inline(child).strip())
        elif child.tag in ("arg", "group"):
            parts.append(synopsis_item(child))
    return " ".join(p for p in parts if p)


def render(root):
    out = []
    namediv = root.find("refnamediv")
    if namediv is not None:
        names = ", ".join(inline(n).strip() for n in namediv.findall("refname"))
        purpose = inline(namediv.find("refpurpose")).strip() if namediv.find("refpurpose") is not None else ""
        out += ["Name", ""] + wrap(f"{names} - {purpose}" if purpose else names, 3)
    syn = root.find("refsynopsisdiv")
    if syn is not None:
        out += ["Synopsis", ""]
        for cmd in syn.findall("cmdsynopsis"):
            out += wrap(synopsis(cmd), 3)
    for sect in root.findall("refsect1"):
        title = re.sub(r"\s+", " ", sect.findtext("title") or "").strip()
        out += [title, ""] + blocks(sect, 3)
    while out and not out[-1]:
        out.pop()
    return "\n".join(out) + "\n"


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    # The desc files declare the DocBook DTD but use no entities from it,
    # so ElementTree can parse them without fetching it.
    sys.stdout.write(render(ET.parse(sys.argv[1]).getroot()))


if __name__ == "__main__":
    main()
