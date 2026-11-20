# geocode-glib (libsoup3 flavour, geocode-glib-2.0) - gnome-settings-
# daemon's timezone/location code.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Denable-installed-tests=false \
    -Denable-gtk-doc=false \
    -Dsoup2=false \
    -Denable-introspection=true

ninja -C build
ninja -C build install
