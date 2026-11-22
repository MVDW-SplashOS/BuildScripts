# librsvg - autotools + cargo. GNOME Shell imports Rsvg-2.0 at startup
# (ui/init.js); without the typelib gnome-shell exits at once and GDM
# loops autologin sessions. Also installs the gdk-pixbuf SVG loader that
# the Adwaita symbolic icons need.
#
# 2.58.x is the last series built with plain cargo; 2.59+ needs cargo-c.
# The upstream tarball does NOT vendor its crates: SourceStream does it at
# repack time (`cargo_vendor: true` in upstream-sources.yml -> cargo vendor
# --locked + a .cargo/config.toml redirecting crates-io to vendor/), so the
# chroot build runs offline (same scheme as splash_boot_manager).
export CARGO_HOME="$PWD/.cargo-home"
export CARGO_NET_OFFLINE=true

./configure --prefix=/usr \
            --enable-introspection=yes \
            --enable-vala=no \
            --disable-gtk-doc \
            --disable-static

make
make install

# Register the new SVG loader in the read-only image's loader cache
gdk-pixbuf-query-loaders --update-cache || true
