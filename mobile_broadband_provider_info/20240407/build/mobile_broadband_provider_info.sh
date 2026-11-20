# mobile-broadband-provider-info - carrier/APN database for the libnma
# mobile broadband assistant and ModemManager.
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
