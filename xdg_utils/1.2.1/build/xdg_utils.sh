# xdg-utils - xdg-open and friends. Shell scripts generated from the
# *.in templates; there is nothing to compile.
#
# Upstream generates each script's --help/--manual text from
# scripts/desc/*.xml with `xmlto txt`, and the default "all" target also
# builds HTML and man pages with xmlto/xsltproc. xmlto (plus the DocBook
# XSL stylesheets and a text browser it needs) is not packaged, so the
# .txt files are rendered with the bundled docbook2txt.py instead, and
# only the scripts are built. "make install" skips the man pages that
# were not generated.
./configure --prefix=/usr

cd scripts
for xml in desc/*.xml; do
    python3 ../../build/docbook2txt.py "$xml" > "$(basename "$xml" .xml).txt"
done

make scripts
make install
