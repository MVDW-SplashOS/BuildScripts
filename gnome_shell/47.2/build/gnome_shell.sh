# GNOME Shell. No portal helper (needs WebKitGTK for captive portals),
# no Extensions app (gnome-extensions CLI is kept).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dportal_helper=false \
    -Dextensions_app=false \
    -Dextensions_tool=true \
    -Dman=false \
    -Dtests=false \
    -Dgtk_doc=false \
    -Dcamera_monitor=true \
    -Dnetworkmanager=true \
    -Dsystemd=true

ninja -C build
ninja -C build install
