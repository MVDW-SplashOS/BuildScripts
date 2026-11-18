# splash-boot-manager - SplashOS LinuxBoot-style graphical boot manager.
# Built with the rust bootstrap toolchain against the GTK4/libadwaita stack
# installed into /usr before this package. The crates are vendored inside
# the tarball (cargo vendor) so the chroot build runs offline; .cargo/
# config.toml in the source tree redirects crates-io to the vendor dir.
export CARGO_HOME="$PWD/.cargo-home"
cargo build --release --offline

install -v -m755 target/release/splash-boot-manager /usr/bin/

# Boot logo (see the README in the source tree):
#   boot-logo.gif  - GTK splash page (gdk-pixbuf cannot read APNG)
#   boot-logo.raw  - SPLASHLOGO2 BGR24 frame array for the fbdev player
# The raw asset is a 66MB flat array, so the source tree carries it
# xz-compressed (~1MB) and it is decompressed here.
mkdir -p /usr/share/splashos
install -v -m644 assets/boot-logo.gif /usr/share/splashos/
xz -dc assets/boot-logo.raw.xz > /usr/share/splashos/boot-logo.raw || exit 1
chmod -v 644 /usr/share/splashos/boot-logo.raw

# Compile the dependency-free framebuffer player (also used by the kexec
# blit path with SPLASH_ONCE=1).
gcc -O2 -o /usr/bin/splash-logo splash-logo.c
