# gtk4 - meson build. Wayland backend only (no X11, no broadway), no
# vulkan, no gstreamer media backend, no print backends, no demos/tests,
# no introspection (gobject-introspection is not packaged). Release
# tarballs ship the precompiled theme css - no sassc needed.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dbuild-demos=false \
    -Dbuild-examples=false \
    -Dbuild-testsuite=false \
    -Dbuild-tests=false \
    -Dintrospection=disabled \
    -Ddocumentation=false \
    -Dman-pages=false \
    -Dvulkan=disabled \
    -Dbroadway-backend=false \
    -Dx11-backend=false \
    -Dmedia-gstreamer=disabled \
    -Dprint-cpdb=disabled \
    -Dprint-cups=disabled \
    -Dcloudproviders=disabled

ninja -C build
ninja -C build install
