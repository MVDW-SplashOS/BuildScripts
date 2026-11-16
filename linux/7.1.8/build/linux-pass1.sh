make mrproper

make defconfig

# ---------------------------------------------------------------------------
# SplashOS kernel deltas on top of x86_64 defconfig.
#
# Kept as a fragment here (SourceStream ships only manifest.yml/build/patch
# with the tarball). merge_config -m only merges the fragment, olddefconfig
# then resolves the remaining symbols — the deltas that are valid stay =y,
# anything unsatisfiable shows up in the merge log instead of silently
# vanishing.
#
# - FRAMEBUFFER_CONSOLE: fixes the boot hang at the virtio-gpu/DRM console
#   handoff (previously worked around with nomodeset on the GRUB cmdline).
#   Needs FB=y (defconfig leaves it unset) and DRM_FBDEV_EMULATION=y, the
#   fbdev layer the console runs on with DRM drivers.
# - KEXEC / KEXEC_FILE: the bootloader edition (LinuxBoot-style) kexecs
#   into target kernels
# - EFI_STUB: the firmware boots the kernel image directly on UEFI
#   (the custom boot manager replaces GRUB)
# - EFIVAR_FS: efibootmgr needs it for --bootnext entries
# ---------------------------------------------------------------------------
cat > splashos.fragment << "EOF"
CONFIG_FB=y
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_KEXEC=y
CONFIG_KEXEC_FILE=y
CONFIG_EFI_STUB=y
CONFIG_EFIVAR_FS=y
EOF

./scripts/kconfig/merge_config.sh -m .config splashos.fragment
make olddefconfig
rm splashos.fragment

# Fail the build if any delta did not survive kconfig resolution (a renamed
# or newly constrained symbol must be noticed here, not at boot time).
for sym in FRAMEBUFFER_CONSOLE KEXEC KEXEC_FILE EFI_STUB EFIVAR_FS; do
    grep -q "^CONFIG_${sym}=y$" .config || {
        echo "FATAL: CONFIG_${sym} missing from the kernel config" >&2
        exit 1
    }
done

make
make modules_install

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-7.1.8-splashos-13.1-systemd
cp -iv System.map /boot/System.map-7.1.8
cp -iv .config /boot/config-7.1.8
cp -r Documentation -T /usr/share/doc/linux-7.1.8

install -v -m755 -d /etc/modprobe.d

cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF
