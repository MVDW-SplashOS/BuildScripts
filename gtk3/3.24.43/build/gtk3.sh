# GTK 3 - still required in GNOME 47 by gnome-settings-daemon,
# gnome-session, gdm and libcanberra-gtk3. X11 + Wayland backends, with
# introspection.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dx11_backend=true \
    -Dwayland_backend=true \
    -Dbroadway_backend=false \
    -Dintrospection=true \
    -Dcolord=no \
    -Dcloudproviders=false \
    -Dtracker3=false \
    -Dprint_backends=file \
    -Dgtk_doc=false \
    -Dman=false \
    -Ddemos=false \
    -Dexamples=false \
    -Dtests=false \
    -Dinstalled_tests=false

ninja -C build
ninja -C build install

gtk-query-immodules-3.0 --update-cache
glib-compile-schemas /usr/share/glib-2.0/schemas
