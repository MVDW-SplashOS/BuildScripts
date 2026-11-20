# libadwaita 1.6 - GNOME 47 apps (Nautilus, Console, Software) require
# >= 1.6. The bootloader edition keeps 1.5.6. With introspection.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dexamples=false \
    -Dintrospection=enabled \
    -Dvapi=false \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
