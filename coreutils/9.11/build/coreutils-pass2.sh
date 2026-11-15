# LFS r13.1: the i18n patch modifies the build system; autoreconf must NOT use
# -i here (configure.ac pins an old gettext version), and automake -af must
# follow to update the auxiliary files.
autoreconf -fv
automake -af
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make
make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8