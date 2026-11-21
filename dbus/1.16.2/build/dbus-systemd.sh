# D-Bus rebuilt after systemd (LFS builds it after systemd too). Pass 1
# runs in molecule before systemd exists, so meson auto-disables systemd
# support and installs no dbus.service / dbus.socket. Without those units
# there is no system bus: logind, polkit, accounts-daemon, GDM and
# gnome-shell all fail. Force systemd support on here so a missing systemd
# is a build error instead of a silently unbootable desktop.
mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback \
    -D systemd=enabled \
    -D systemd_system_unitdir=/usr/lib/systemd/system \
    -D systemd_user_unitdir=/usr/lib/systemd/user \
    -D user_session=true \
    ..

ninja
ninja install

ln -sfv /etc/machine-id /var/lib/dbus

# ninja install sets these when run as root; make sure, since a missing
# setuid bit on the launch helper breaks bus activation of system services.
chown -v root:messagebus /usr/libexec/dbus-daemon-launch-helper
chmod -v 4750 /usr/libexec/dbus-daemon-launch-helper

# dbus.socket is pulled in via sockets.target.wants installed under
# /usr/lib/systemd/system by the build; enable explicitly as well so the
# system bus starts at boot even if that symlink is not shipped.
systemctl enable dbus.socket || true
