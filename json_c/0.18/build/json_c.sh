# json-c - JSON library for cryptsetup (LUKS2 metadata) and libnvme.
#
# CMAKE_POLICY_VERSION_MINIMUM=3.5: apps/CMakeLists.txt still declares
# cmake_minimum_required(VERSION 2.8), which CMake 4 rejects ("Compatibility
# with CMake < 3.5 has been removed"). Same fix as BLFS.
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_STATIC_LIBS=OFF \
      -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
      ..

make
make install
