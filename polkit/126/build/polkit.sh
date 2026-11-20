# polkit - authorization framework. flatpak's system helper uses it so
# members of the wheel group can install/update system-wide Flatpaks
# (stored on the persistent /var) without being root; GNOME's polkit
# agent sits on top of it.
#
# No PAM on SplashOS (yet): authenticate against /etc/shadow.
# JS engine: duktape (auto-detected; see duktape/2.7.0) instead of mozjs.
getent group polkitd >/dev/null || groupadd -fg 27 polkitd
getent passwd polkitd >/dev/null || \
    useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
        -g polkitd -s /bin/false polkitd

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dman=false \
    -Dtests=false \
    -Dexamples=false \
    -Dgtk_doc=false \
    -Dintrospection=true \
    -Dsession_tracking=logind \
    -Dauthfw=shadow \
    -Dos_type=lfs \
    -Dprivileged_group=wheel

ninja -C build
ninja -C build install
