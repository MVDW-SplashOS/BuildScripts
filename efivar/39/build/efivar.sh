# efivar uses a custom Makefile (no configure). Docs are enabled by default
# and need mandoc, which the distro does not carry; ENABLE_DOCS=0 is the
# supported switch to skip them (src/include/defaults.mk).
# libdir is passed explicitly so the libs land in /usr/lib on multiarch
# layouts as well.
make ENABLE_DOCS=0 libdir=/usr/lib

make ENABLE_DOCS=0 libdir=/usr/lib install
