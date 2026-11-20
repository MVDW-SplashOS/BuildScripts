# libportal - portal client library; Nautilus needs libportal-gtk4.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dbackend-gtk3=disabled \
    -Dbackend-gtk4=enabled \
    -Dbackend-qt5=disabled \
    -Dbackend-qt6=disabled \
    -Ddocs=false \
    -Dtests=false \
    -Dvapi=false \
    -Dintrospection=true

ninja -C build
ninja -C build install
