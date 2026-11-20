# colord - colour profile daemon; Mutter and gnome-settings-daemon require
# it. Runs as its own unprivileged user.
getent group colord >/dev/null || groupadd -g 71 colord
getent passwd colord >/dev/null || \
    useradd -c "Color Daemon Owner" -d /var/lib/colord -u 71 -g colord -s /bin/false colord

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddaemon_user=colord \
    -Dvapi=false \
    -Dsystemd=true \
    -Dlibcolordcompat=false \
    -Dargyllcms_sensor=false \
    -Dbash_completion=false \
    -Ddocs=false \
    -Dman=false \
    -Dtests=false \
    -Dinstalled_tests=false \
    -Dsane=false \
    -Dprint_profiles=false \
    -Dintrospection=true

ninja -C build
ninja -C build install
