# shared-mime-info - provides update-mime-database and the shared MIME
# database. The desktop edition registers application/vnd.appimage here so
# file managers and the GTK open dialog treat AppImages as executables.
#
# -Dupdate-mimedb=true compiles the database right after install (no
# DESTDIR is used in the chroot build, so the in-tree prefix is correct).
# Translations and the test suite are not needed in the image.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dbuild-translations=false \
    -Dbuild-tests=false \
    -Dupdate-mimedb=true

ninja -C build
ninja -C build install
