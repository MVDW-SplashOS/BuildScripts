# GSettings schemas shared by the GNOME desktop.
sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=true

ninja -C build
ninja -C build install

glib-compile-schemas /usr/share/glib-2.0/schemas
