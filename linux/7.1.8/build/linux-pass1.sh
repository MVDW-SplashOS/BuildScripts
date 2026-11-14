make mrproper
make defconfig

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