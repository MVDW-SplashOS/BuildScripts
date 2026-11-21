# evolution-data-server - calendar/contacts storage; GNOME Shell hard-
# requires libecal/libedataserver (calendar server in the clock menu).
# No GOA/WebKit OAuth/LDAP/Kerberos/libdb/phonenumber.
#
# -std=gnu17: GCC >= 15 defaults to C23, where bool is a keyword, and
# camel-sexp.c has local variables named `bool` ("two or more data types
# in declaration specifiers").
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_C_FLAGS="-std=gnu17" \
      -D SYSCONF_INSTALL_DIR=/etc \
      -D ENABLE_VALA_BINDINGS=OFF \
      -D ENABLE_INSTALLED_TESTS=OFF \
      -D ENABLE_TESTS=OFF \
      -D ENABLE_EXAMPLES=OFF \
      -D ENABLE_GTK_DOC=OFF \
      -D ENABLE_GI_DOCGEN=OFF \
      -D ENABLE_INTROSPECTION=ON \
      -D ENABLE_GOA=OFF \
      -D ENABLE_OAUTH2_WEBKITGTK=OFF \
      -D ENABLE_OAUTH2_WEBKITGTK4=OFF \
      -D ENABLE_GTK=ON \
      -D ENABLE_GTK4=ON \
      -D ENABLE_WEATHER=ON \
      -D ENABLE_CANBERRA=ON \
      -D WITH_OPENLDAP=OFF \
      -D WITH_KRB5=OFF \
      -D WITH_LIBDB=OFF \
      -D WITH_PHONENUMBER=OFF \
      -D WITH_SYSTEMDUSERUNITDIR=/usr/lib/systemd/user \
      -G Ninja \
      ..

ninja
ninja install
