# flatpak - THE package manager of SplashOS Desktop.
#
#   - system installs go to /var/lib/flatpak, which is on the persistent
#     splashos-data partition (the image root itself is read-only);
#   - members of "wheel" may manage system Flatpaks through the polkit-
#     authorized system helper;
#   - bubblewrap, xdg-dbus-proxy and fusermount3 come from their own
#     packages instead of flatpak's bundled copies;
#   - libcurl HTTP backend (no libsoup in desktop-base).
#
# wayland_security_context / xauth / dconf need libraries from the session
# layer, which is built after this one; they are disabled here.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    --sysconfdir=/etc \
    --localstatedir=/var \
    -Dsystem_install_dir=/var/lib/flatpak \
    -Dsystem_bubblewrap=bwrap \
    -Dsystem_dbus_proxy=xdg-dbus-proxy \
    -Dsystem_fusermount=fusermount3 \
    -Dsystem_helper=enabled \
    -Dprivileged_group=wheel \
    -Dhttp_backend=curl \
    -Dsystemd=enabled \
    -Dseccomp=enabled \
    -Dlibzstd=enabled \
    -Dmalcontent=disabled \
    -Ddconf=disabled \
    -Dwayland_security_context=disabled \
    -Dxauth=disabled \
    -Dselinux_module=disabled \
    -Dgir=disabled \
    -Dgtkdoc=disabled \
    -Ddocbook_docs=disabled \
    -Dman=disabled \
    -Dtests=false \
    -Dinstalled_tests=false

ninja -C build
ninja -C build install
