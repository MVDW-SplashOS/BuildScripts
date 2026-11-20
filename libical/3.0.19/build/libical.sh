# libical (+ libical-glib with GI) - iCalendar; evolution-data-server's
# calendar (GNOME Shell clock/calendar menu).
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D SHARED_ONLY=yes \
      -D ICAL_BUILD_DOCS=false \
      -D ICAL_GLIB=true \
      -D GOBJECT_INTROSPECTION=true \
      -D ICAL_GLIB_VAPI=false \
      -D LIBICAL_BUILD_TESTING=false \
      -D WITH_CXX_BINDINGS=false \
      -D USE_BUILTIN_TZDATA=false \
      ..

make -j1
make install
