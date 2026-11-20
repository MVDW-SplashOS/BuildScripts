# libcanberra - XDG event sounds (Mutter; gnome-settings-daemon needs the
# GTK3 module). Pulse backend = pipewire-pulse.
# Wayland fix (what BLFS's libcanberra-0.30-wayland-1.patch does): only
# use the X11 display hooks when GDK actually runs on X11, otherwise the
# GTK module crashes under a Wayland session.
sed -i 's/GDK_DISPLAY_XDISPLAY(gdk_display_get_default())/(GDK_IS_X11_DISPLAY(gdk_display_get_default()) ? GDK_DISPLAY_XDISPLAY(gdk_display_get_default()) : NULL)/' src/canberra-gtk-module.c

./configure --prefix=/usr \
    --disable-oss \
    --disable-gtk \
    --enable-gtk3 \
    --enable-pulse \
    --enable-alsa \
    --disable-gstreamer \
    --disable-tdb \
    --disable-lynx \
    --disable-gtk-doc

make
make install
