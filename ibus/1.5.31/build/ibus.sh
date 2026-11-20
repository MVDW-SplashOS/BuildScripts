# IBus - input method framework; GNOME Shell hard-requires it (input
# sources, IBus typelib). Core daemon + simple engine + GI only: no GTK
# IM modules (GTK uses the Wayland text-input protocol under Mutter), no
# Python/Vala, no Unicode/emoji dictionaries (need UCD/CLDR data).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --disable-gtk2 \
    --disable-gtk3 \
    --disable-gtk4 \
    --disable-xim \
    --disable-ui \
    --disable-setup \
    --disable-python-library \
    --disable-python2 \
    --disable-appindicator \
    --disable-libnotify \
    --disable-tests \
    --disable-gtk-doc \
    --disable-vala \
    --disable-emoji-dict \
    --disable-unicode-dict \
    --enable-introspection \
    --enable-wayland

make
make install

gzip -dfv /usr/share/man/man7/ibus*.7.gz 2>/dev/null || true
