# gtk4 - meson build. Wayland backend only (no X11, no broadway), no
# vulkan, no gstreamer media backend, no print backends, no demos/tests,
# no introspection (gobject-introspection is not packaged). Release
# tarballs ship the precompiled theme css - no sassc needed.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddemos=false \
    -Dexamples=false \
    -Dbuild-tests=false \
    -Dintrospection=disabled \
    -Dgtk_doc=false \
    -Dman=false \
    -Dvulkan=disabled \
    -Dbroadway-backend=disabled \
    -Dx11-backend=disabled \
    -Dmedia-gstreamer=disabled \
    -Dprint-backends=none \
    -Dcloudproviders=disabled

ninja -C build
ninja -C build install
