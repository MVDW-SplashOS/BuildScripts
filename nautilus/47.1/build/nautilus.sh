# Nautilus (Files). No extensions (image/audio properties need gexiv2 +
# more GStreamer), no PackageKit, no cloud providers.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dextensions=false \
    -Dpackagekit=false \
    -Dcloudproviders=false \
    -Dselinux=false \
    -Ddocs=false \
    -Dtests=none \
    -Dintrospection=true

ninja -C build
ninja -C build install
