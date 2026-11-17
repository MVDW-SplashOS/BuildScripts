# appstream - AppStream metadata library; libadwaita 1.5 requires it
# (About-window release/metadata parsing). The options mirror libadwaita's
# own subproject fallback (systemd/apidocs/install-docs/stemming/
# svg-support/gir) plus the remaining optional backends the stack does
# not need. Requires gperf (base) and the xmlb/libcurl/libyaml/libxml2
# libraries, all built earlier in this edition.
#
# docs/meson.build is unconditional (subdir('docs/')) and generates the
# appstreamcli man pages via xsltproc + the DocBook XSL stylesheets.
# Nothing in this edition reads the man pages, so drop that block (the
# full-documentation path behind 'docs' is already disabled).
python3 - <<'EOF'
p = 'docs/meson.build'
s = open(p).read()
start = s.index("# make manual pages")
end = s.index("if get_option('docs') or get_option('apidocs')")
open(p, 'w').write(s[:start] + s[end:])
EOF

# data/meson.build regenerates appstreamcli's own metainfo file and
# merges its translations via i18n.itstool_join - which needs the
# itstool program (and pulls libxml2's Python bindings). Nothing in
# this edition uses that metainfo, so drop the block before configuring.
python3 - <<'EOF'
p = 'data/meson.build'
s = open(p).read()
start = s.index("metainfo_with_relinfo = custom_target(")
end = s.index("# install appstream.conf default template")
open(p, 'w').write(s[:start] + s[end:])
EOF

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsystemd=false \
    -Dapidocs=false \
    -Dinstall-docs=false \
    -Dstemming=false \
    -Dsvg-support=false \
    -Dgir=false \
    -Dvapi=false \
    -Dcompose=false \
    -Dapt-support=false \
    -Dqt=false

ninja -C build
ninja -C build install
