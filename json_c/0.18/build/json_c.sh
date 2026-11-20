# json-c - JSON library for cryptsetup (LUKS2 metadata) and libnvme.
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_STATIC_LIBS=OFF \
      ..

make
make install
