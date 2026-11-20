# PyGObject - libgweather's build generates its locations database with a
# Python script that imports gi. No pycairo.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dpycairo=disabled \
    -Dtests=false

ninja -C build
ninja -C build install
