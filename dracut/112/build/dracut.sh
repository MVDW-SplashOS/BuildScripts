# Documentation needs asciidoctor, which the distro does not carry. The
# dracut-cpio companion tool needs Rust/cargo and is optional (dracut falls
# back to the plain cpio binary for initramfs creation), so configure skips
# it automatically when cargo is absent.
#
# The patch makes the dracut modules' dependency on systemd-sysusers
# conditional: SplashOS builds systemd with -Dsysusers=false (LFS r13.1),
# so the binary does not exist and an unconditional depends() aborts the
# whole systemd initramfs chain (journald -> systemd-initrd -> dracut-systemd).
patch -Np1 -i ../patch/splash-sysusers-deps-1.patch

./configure --prefix=/usr \
            --sysconfdir=/etc \
            --disable-documentation

make
make install
