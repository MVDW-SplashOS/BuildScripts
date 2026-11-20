# xdg-user-dirs - xdg-user-dir / xdg-user-dirs-update, used by the desktop
# session to create and resolve the standard user directories (Desktop,
# Downloads, ...).
#
# Documentation is disabled: it needs xsltproc (libxslt), which is not part
# of the image, and the man pages are not required at run time.
./configure --prefix=/usr \
    --disable-documentation

make
make install
