# PipeWire - audio/video server: sound (pipewire-pulse replaces the
# PulseAudio daemon), screencast/camera portals, GNOME Shell recording.
# The session manager (WirePlumber) is its own package.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsession-managers=[] \
    -Dexamples=disabled \
    -Dtests=disabled \
    -Ddocs=disabled \
    -Dman=disabled \
    -Djack=disabled \
    -Dpipewire-jack=disabled \
    -Dpipewire-v4l2=disabled \
    -Dv4l2=disabled \
    -Dlibcamera=disabled \
    -Dbluez5=disabled \
    -Dgstreamer=disabled \
    -Droc=disabled \
    -Davahi=disabled \
    -Decho-cancel-webrtc=disabled \
    -Dlibmysofa=disabled \
    -Dlv2=disabled \
    -Draop=disabled \
    -Dsdl2=disabled \
    -Dlibcanberra=enabled \
    -Dlibpulse=enabled \
    -Dselinux=disabled \
    -Dsystemd-user-service=enabled \
    -Dflatpak=enabled \
    -Dx11=enabled

ninja -C build
ninja -C build install
