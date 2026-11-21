# qpdf - PDF manipulation library; libcupsfilters requires it (PDF
# page handling in the filter chain). OpenSSL crypto.
# GCC 16's libstdc++ no longer pulls <cstdint> in through other headers;
# libtests/cxx11.cc uses uint32_t/uint64_t without including it.
sed -i '1i #include <cstdint>' libtests/cxx11.cc

mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_STATIC_LIBS=OFF \
      -D REQUIRE_CRYPTO_OPENSSL=ON \
      -D DEFAULT_CRYPTO=openssl \
      -D USE_IMPLICIT_CRYPTO=OFF \
      -D INSTALL_EXAMPLES=OFF \
      -D BUILD_DOC=OFF \
      ..

make
make install
