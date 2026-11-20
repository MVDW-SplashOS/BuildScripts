# Poppler - PDF rendering. poppler-cpp is what libcupsfilters links
# (pdftoraster, PDF page info); pdftops/pdftocairo are used by libppd's
# filters. The GLib frontend (with GI) also serves the desktop (PDF
# thumbnails/previews). No Qt, Boost, NSS signatures, gpgme or curl.
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D TESTDATADIR=$PWD/testfiles \
      -D ENABLE_UNSTABLE_API_ABI_HEADERS=ON \
      -D ENABLE_QT5=OFF \
      -D ENABLE_QT6=OFF \
      -D ENABLE_BOOST=OFF \
      -D ENABLE_NSS3=OFF \
      -D ENABLE_GPGME=OFF \
      -D ENABLE_LIBCURL=OFF \
      -D ENABLE_LIBOPENJPEG=openjpeg2 \
      -D ENABLE_DCTDECODER=libjpeg \
      -D ENABLE_LCMS=ON \
      -D ENABLE_LIBTIFF=ON \
      -D ENABLE_CPP=ON \
      -D ENABLE_GLIB=ON \
      -D ENABLE_GOBJECT_INTROSPECTION=ON \
      -D ENABLE_GTK_DOC=OFF \
      -D ENABLE_UTILS=ON \
      -D BUILD_GTK_TESTS=OFF \
      -D BUILD_CPP_TESTS=OFF \
      -D BUILD_MANUAL_TESTS=OFF \
      -G Ninja \
      ..

ninja
ninja install
