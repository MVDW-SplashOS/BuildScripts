# gcr 3 (gck-1, gcr-base-3) - gnome-keyring 46 still links it. No GTK3
# UI parts, no ssh-agent (gcr 4 provides that).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk_doc=false \
    -Dintrospection=false \
    -Dgtk=false \
    -Dssh_agent=false \
    -Dsystemd=disabled

ninja -C build
ninja -C build install
