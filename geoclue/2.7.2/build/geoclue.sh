# GeoClue 2 - location service (GNOME Shell imports the Geoclue typelib;
# automatic timezone, night light). WiFi geolocation only: no modem/NMEA
# sources (no ModemManager/Avahi).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk-doc=false \
    -D3g-source=false \
    -Dcdma-source=false \
    -Dmodem-gps-source=false \
    -Dnmea-source=false \
    -Ddemo-agent=false \
    -Dvapi=false \
    -Dlibgeoclue=true \
    -Dintrospection=true

ninja -C build
ninja -C build install
