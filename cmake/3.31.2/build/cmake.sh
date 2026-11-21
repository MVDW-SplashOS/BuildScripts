# cmake - build system for libical, evolution-data-server and nss tooling.
# Bundled third-party libs except the ones the base system provides.
#
# --system-curl: the curl copy bundled with cmake 3.31 does not compile
# against OpenSSL 4 (it dereferences ASN1_INTEGER/ASN1_BIT_STRING, which
# OpenSSL 4 made opaque). The system libcurl 8.18 (desktop-base) does.
# The bundled nghttp2 is only used by the bundled curl.
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake

# curl >= 8.16 defines the CURL_NETRC_* and CURLPROXY_* option values as
# long constants instead of enum members, so assigning them to variables
# of the old enum types is a C++ error with the system curl. Store them
# as long, as cmake >= 3.31.9 does upstream.
sed -i 's/^  CURL_NETRC_OPTION curl_netrc_level =/  long curl_netrc_level =/' Source/cmCurl.cxx
sed -i 's/^  curl_proxytype HTTPProxyType;/  long HTTPProxyType;/' Source/CTest/cmCTestCurl.h

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
    --docdir=/share/doc/cmake-3.31.2 \
    --parallel="$(echo "$MAKEFLAGS" | sed -n "s/.*-j *\([0-9]*\).*/\1/p" | grep . || nproc)"

make
make install
