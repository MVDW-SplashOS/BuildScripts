# efivar uses a custom Makefile (no configure). Docs are enabled by default
# and need mandoc, which the distro does not carry; ENABLE_DOCS=0 is the
# supported switch to skip them (src/include/defaults.mk).
# libdir is passed explicitly so the libs land in /usr/lib on multiarch
# layouts as well.
#
# efivar 39 predates glibc >= 2.42's const-qualified strchr/strstr/strrchr:
# the linux-* device parsers assign those results to char* and the build
# hard-errors via -Werror (-Werror=discarded-qualifiers, dozens of sites,
# fixed properly in later efivar releases). Downgrade exactly this one
# -Werror class to a warning through efivar's own ERRORS_GCC hook until the
# package is rebased; every other warning still fails the build.
make ENABLE_DOCS=0 libdir=/usr/lib \
     ERRORS_GCC="-Wno-error=discarded-qualifiers"

make ENABLE_DOCS=0 libdir=/usr/lib \
     ERRORS_GCC="-Wno-error=discarded-qualifiers" install
