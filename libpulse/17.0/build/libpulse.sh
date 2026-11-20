# PulseAudio CLIENT library only (libpulse, libpulse-mainloop-glib):
# gnome-settings-daemon and libcanberra speak the Pulse API, the server
# side is pipewire-pulse.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddaemon=false \
    -Dclient=true \
    -Ddoxygen=false \
    -Dman=false \
    -Dtests=false \
    -Ddatabase=simple \
    -Dbluez5=disabled \
    -Dgtk=disabled \
    -Djack=disabled \
    -Dlirc=disabled \
    -Dorc=disabled \
    -Dwebrtc-aec=disabled \
    -Dtcpwrap=disabled \
    -Dx11=disabled \
    -Davahi=disabled \
    -Dgstreamer=disabled \
    -Dvalgrind=disabled \
    -Dfftw=disabled \
    -Dsoxr=disabled \
    -Dspeex=disabled

ninja -C build
ninja -C build install
