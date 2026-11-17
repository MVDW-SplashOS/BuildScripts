# libsass - the Sass stylesheet compiler library. libadwaita's meson
# invokes the sassc CLI to compile the Adwaita theme at build time, and
# sassc links this library.
#
# The tag archive ships no autotools-generated configure (and the 2021
# automake setup would clash with the chroot's automake 1.18), so use the
# hand-written dev Makefile: 'shared' builds lib/libsass.so and
# 'install-shared' installs the library plus the sass.h headers.
make shared

make install-shared PREFIX=/usr
