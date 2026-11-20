# AccountsService - user list for GDM and GNOME Shell (AccountsService
# typelib). wheel is the admin group.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dadmin_group=wheel \
    -Dintrospection=true \
    -Dvapi=false \
    -Ddocbook=false \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
