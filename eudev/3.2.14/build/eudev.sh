# eudev - udev without systemd. gperf from the molecule base. The daemon is
# only needed at runtime (libinput/wlroots enumerate input devices through
# the udev database); devtmpfs already creates the device nodes themselves.
# NOTE: udevd installs natively to /usr/sbin/udevd (the --libexecdir only
# moves the helper binaries). Do NOT symlink anything onto /usr/sbin/udevd -
# the previous build clobbered the real binary with a dangling
# /usr/sbin/udevd -> /usr/lib/udev/udevd link, udevd never ran and
# libinput/cage aborted with 'no input devices'.
./configure --prefix=/usr \
            --sysconfdir=/etc \
            --libexecdir=/usr/lib/udev \
            --disable-static \
            --disable-manpages

make
make install
