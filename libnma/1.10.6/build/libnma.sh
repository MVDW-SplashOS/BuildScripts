# libnma - NetworkManager dialogs (Wi-Fi security, VPN, mobile broadband
# assistant). Settings' network panel needs libnma-gtk4; the GTK3
# library is always built too.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dlibnma_gtk4=true \
    -Dgcr=false \
    -Dgtk_doc=false \
    -Dvapi=false \
    -Dintrospection=true \
    -Dmobile_broadband_provider_info=true \
    -Diso_codes=true

ninja -C build
ninja -C build install
