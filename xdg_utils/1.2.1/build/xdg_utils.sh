# xdg-utils - xdg-open and friends. Shell scripts generated from the
# *.in templates; there is nothing to compile.
#
# Build only the scripts target: the default "all" also builds HTML and
# man pages through xmlto, which is not packaged. "make install" installs
# the generated scripts and skips man pages that were not generated.
./configure --prefix=/usr

make scripts
make install
