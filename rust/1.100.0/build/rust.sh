# Rust bootstrap install: pre-built toolchain binaries (rustc, cargo,
# rust-std), no compilation needed. Docs, clippy, rustfmt and the other
# preview components are skipped to keep the install lean.
#
# The ldconfig warning when not running as root is harmless; the real
# build runs as root in the chroot.
./install.sh --prefix=/usr \
             --components=rustc,cargo,rust-std-x86_64-unknown-linux-gnu
