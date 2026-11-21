# AccountsService - user list for GDM and GNOME Shell (AccountsService
# typelib). wheel is the admin group.

# Skip the test suite: it builds the bundled mocklibc subproject (an
# LD_PRELOAD fake libc used only by the tests), whose netgroup-debug.c
# calls an undeclared function and fails under GCC >= 14 (implicit
# function declarations are errors). The tests are not run here, and
# accountsservice has no option to turn them off.
sed -i "/^subdir('tests')$/d" meson.build

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dadmin_group=wheel \
    -Dintrospection=true \
    -Dvapi=false \
    -Ddocbook=false \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
