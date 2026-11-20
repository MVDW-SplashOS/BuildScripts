# dconf - GSettings backend for the desktop.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dbash_completion=false \
    -Dman=false \
    -Dvapi=false \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
