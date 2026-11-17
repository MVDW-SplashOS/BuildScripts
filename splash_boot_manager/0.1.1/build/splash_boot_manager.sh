# splash-boot-manager - SplashOS LinuxBoot-style graphical boot manager.
# Built with the rust bootstrap toolchain against the GTK4/libadwaita stack
# installed into /usr before this package. The crates are vendored inside
# the tarball (cargo vendor) so the chroot build runs offline; .cargo/
# config.toml in the source tree redirects crates-io to the vendor dir.
export CARGO_HOME="$PWD/.cargo-home"
cargo build --release --offline

install -v -m755 target/release/splash-boot-manager /usr/bin/

# Boot logo: the animated asset is displayed by the graphical UI, the
# SPLASHLOGO1 raw asset is blitted pre-graphically by /usr/bin/splash-logo
# (single static frame: the screen keeps it until kexec replaces it).
mkdir -p /usr/share/splashos
install -v -m644 assets/boot-logo.gif assets/boot-logo.raw /usr/share/splashos/
gcc -O2 -o /usr/bin/splash-logo splash-logo.c
