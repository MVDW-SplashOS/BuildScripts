# cmake - build system for libical, evolution-data-server, poppler, qpdf,
# openjpeg, json-c and brlaser. Bundled third-party libs except the ones
# the base system provides.
#
# --system-curl: cmake's bundled curl has not kept up with OpenSSL 4
# (3.31's copy dereferences ASN1_INTEGER/ASN1_BIT_STRING, which OpenSSL 4
# made opaque); the system libcurl 8.18 (desktop-base) is built against
# it. The bundled nghttp2 is only used by the bundled curl.
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake

./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --no-system-jsoncpp \
    --no-system-cppdap \
    --no-system-librhash \
    --no-system-libuv \
    --system-curl \
    --no-system-nghttp2 \
    --no-system-libarchive \
    --docdir=/share/doc/cmake-4.4.5 \
    --parallel="$(echo "$MAKEFLAGS" | sed -n "s/.*-j *\([0-9]*\).*/\1/p" | grep . || nproc)"

make
make install
