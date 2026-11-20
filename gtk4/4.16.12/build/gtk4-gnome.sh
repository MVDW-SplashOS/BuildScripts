# gtk4, buildmode 2 (desktop-gnome): WITH introspection (Gtk-4.0 typelib for
# GNOME Shell/gjs) and the X11 backend (Mutter's X11 frames client,
# Xwayland apps). GStreamer media and CUPS printing stay off (GStreamer is
# built later in this layer). Mode 1 is the bootloader build.
meson setup build-gnome \
    --prefix=/usr \
    --buildtype=release \
    -Dbuild-demos=false \
    -Dbuild-examples=false \
    -Dbuild-testsuite=false \
    -Dbuild-tests=false \
    -Dintrospection=enabled \
    -Ddocumentation=false \
    -Dman-pages=false \
    -Dvulkan=disabled \
    -Dbroadway-backend=false \
    -Dx11-backend=true \
    -Dwayland-backend=true \
    -Dmedia-gstreamer=disabled \
    -Dprint-cpdb=disabled \
    -Dprint-cups=disabled \
    -Dcloudproviders=disabled

ninja -C build-gnome
ninja -C build-gnome install

gtk4-update-icon-cache -qtf /usr/share/icons/hicolor || true
glib-compile-schemas /usr/share/glib-2.0/schemas
