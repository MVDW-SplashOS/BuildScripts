# GNOME Online Accounts - Settings' Online Accounts panel (goa-1.0 +
# goa-backend-1.0 are hard dependencies). No Kerberos.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dkerberos=false \
    -Dfedora=false \
    -Ddocumentation=false \
    -Dman=false \
    -Dvapi=false \
    -Dintrospection=true \
    -Dgoabackend=true

ninja -C build
ninja -C build install
