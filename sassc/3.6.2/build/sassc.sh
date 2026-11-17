# sassc - the Sass CLI that libadwaita's meson invokes to compile the
# Adwaita stylesheet into the resources baked into the library.
#
# The upstream Makefile expects a libsass source checkout as a sibling;
# here libsass is already installed system-wide (library + headers), so
# compile the single-file CLI directly against it.
gcc -O2 -DSASSC_VERSION='"3.6.2"' -o /usr/bin/sassc sassc.c -L/usr/lib -lsass

sassc -v
