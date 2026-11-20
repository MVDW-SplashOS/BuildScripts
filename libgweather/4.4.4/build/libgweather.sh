# libgweather 4 - weather/locations (GNOME Shell imports GWeather;
# gnome-settings-daemon, EDS weather backend).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk_doc=false \
    -Dtests=false \
    -Denable_vala=false \
    -Dintrospection=true \
    -Dsoup2=false

ninja -C build
ninja -C build install
