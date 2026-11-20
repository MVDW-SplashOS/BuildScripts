# libnvme - NVMe management library (libblockdev nvme plugin -> udisks2).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dpython=disabled \
    -Dtests=false \
    -Ddocs=false \
    -Dopenssl=enabled \
    -Djson-c=enabled \
    -Dkeyutils=enabled

ninja -C build
ninja -C build install
