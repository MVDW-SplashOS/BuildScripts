# colord-gtk (GTK4) - Settings' Color panel.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk4=true \
    -Dgtk3=false \
    -Dgtk2=false \
    -Dvapi=false \
    -Ddocs=false \
    -Dman=false \
    -Dtests=false \
    -Dintrospection=true

ninja -C build
ninja -C build install
