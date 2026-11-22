# splash-boot-screen - SplashOS boot screen: the Splash Boot Manager's logo
# (last animation frame, same position/size) + a progress bar fed by
# systemd's Manager.Progress. Installs the binary, the static logo, the
# systemd units (incl. the GDM handoff drop-in) and a dracut module.
make
make install

# The boot screen also runs in the initrd: rebuild it with the dracut
# module included (the initramfs was generated in the distro layer).
KVER=$(basename $(ls -d /lib/modules/*))
dracut --force --kver "$KVER" /boot/initramfs-"$KVER".img
