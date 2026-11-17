# systemd support is optional: configure treats --with-systemd as a hard
# requirement (PKG_CHECK_MODULES errors out when libsystemd is missing), and
# the molecule-based editions (bootmanager) never have systemd. Only request
# it when libsystemd is actually present (the distro edition builds systemd
# before procps); otherwise build without it like plain LFS does.
if pkg-config --exists libsystemd 2>/dev/null; then
    ./configure --prefix=/usr                           \
                --docdir=/usr/share/doc/procps-ng-4.0.7 \
                --disable-static                        \
                --disable-kill                          \
                --enable-watch8bit                      \
                --with-systemd

    make src_w_LDADD='$(LDADD) -lsystemd'
else
    ./configure --prefix=/usr                           \
                --docdir=/usr/share/doc/procps-ng-4.0.7 \
                --disable-static                        \
                --disable-kill                          \
                --enable-watch8bit

    make
fi

make install
