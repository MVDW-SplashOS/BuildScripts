# cmake - build system for libical, evolution-data-server and nss tooling.
# Bundled third-party libs except the ones the base system provides.
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake

./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --no-system-jsoncpp \
    --no-system-cppdap \
    --no-system-librhash \
    --no-system-libuv \
    --no-system-curl \
    --no-system-nghttp2 \
    --no-system-libarchive \
    --docdir=/share/doc/cmake-3.31.2 \
    --parallel=$(nproc)

make
make install
