# gst-plugins-base - pbutils/tag libraries + basic plugins (ogg/vorbis,
# alsa, gl via Mesa).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dexamples=disabled \
    -Dtests=disabled \
    -Ddoc=disabled \
    -Dintrospection=enabled \
    -Dcdparanoia=disabled \
    -Dlibvisual=disabled \
    -Dopus=disabled \
    -Dtheora=disabled \
    -Dtremor=disabled \
    -Dorc=disabled \
    -Dqt5=disabled \
    -Dpackage-origin=https://splashos.com

ninja -C build
ninja -C build install
