# gnome-desktop - both the GTK4 libraries (gnome-desktop-4, gnome-bg-4,
# gnome-rr-4: Mutter, Shell, portal) and the legacy GTK3 library
# (gnome-desktop-3.0: gnome-session, gnome-settings-daemon). Thumbnailers
# are sandboxed with bubblewrap + libseccomp (desktop-base).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dinstalled_tests=false \
    -Ddesktop_docs=false \
    -Ddebug_tools=false \
    -Dgtk_doc=false \
    -Dbuild_gtk4=true \
    -Dlegacy_library=true \
    -Dintrospection=true \
    -Dudev=enabled \
    -Dsystemd=enabled

ninja -C build
ninja -C build install
