# OpenJPEG - JPEG 2000 decoder for poppler (JPX streams in PDFs).
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_STATIC_LIBS=OFF \
      -D BUILD_DOC=OFF \
      -D BUILD_TESTING=OFF \
      ..

make
make install
