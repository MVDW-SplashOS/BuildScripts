# VTE (GTK4 only) - terminal widget for GNOME Console.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk3=false \
    -Dgtk4=true \
    -Dvapi=false \
    -Ddocs=false \
    -Dglade=false \
    -Dgir=true \
    -D_systemd=true

ninja -C build
ninja -C build install
