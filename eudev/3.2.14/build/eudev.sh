# eudev - udev without systemd. gperf from the molecule base. The daemon is
# only needed at runtime (libinput/wlroots enumerate input devices through
# the udev database); devtmpfs already creates the device nodes themselves.
./configure --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib/udev \
            --disable-static \
            --disable-manpages

make
make install
# udevd is expected in the sbin path by the boot init
ln -sfv /usr/lib/udev/udevd /usr/sbin/udevd
