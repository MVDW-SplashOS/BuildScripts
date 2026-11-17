# splash-boot-manager - SplashOS LinuxBoot-style graphical boot manager.
# Built with the rust bootstrap toolchain against the GTK4/libadwaita stack
# installed into /usr before this package. The crates are vendored inside
# the tarball (cargo vendor) so the chroot build runs offline; .cargo/
# config.toml in the source tree redirects crates-io to the vendor dir.
export CARGO_HOME="$PWD/.cargo-home"
cargo build --release --offline

install -v -m755 target/release/splash-boot-manager /usr/bin/
