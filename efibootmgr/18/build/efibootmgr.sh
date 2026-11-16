# efibootmgr uses a custom Makefile and resolves efivar/popt through
# pkg-config; with efivar and popt already installed into /usr the default
# pkg-config search paths find them and no extra flags are needed.
#
# EFIDIR is the distro's reserved EFI System Partition subdirectory name
# (the Makefile aborts without it). It is used as the fallback boot loader
# path (\EFI\SplashOS\...).
# libdir is passed explicitly to match efivar's install layout.
make EFIDIR=SplashOS libdir=/usr/lib

make EFIDIR=SplashOS libdir=/usr/lib install
