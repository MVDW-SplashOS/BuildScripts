# IBus - input method framework; GNOME Shell hard-requires it (input
# sources, IBus typelib). Core daemon + simple engine + GI only: no GTK
# IM modules (GTK uses the Wayland text-input protocol under Mutter), no
# Python/Vala, no Unicode/emoji dictionaries (need UCD/CLDR data).
#
# -std=gnu17: GCC >= 15 defaults to C23, where `f ()` declares a function
# with no parameters; ibusenginesimple.c defines load_emoji_dict () and
# calls it with an argument ("too many arguments to function").
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
    --enable-wayland \
    CFLAGS="${CFLAGS:--O2 -g} -std=gnu17"

make
make install

gzip -dfv /usr/share/man/man7/ibus*.7.gz 2>/dev/null || true
