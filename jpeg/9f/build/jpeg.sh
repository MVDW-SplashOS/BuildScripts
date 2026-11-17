# jpeg (IJG) - autotools build. Provides the libjpeg API and libjpeg.pc
# that gtk4's meson.build requires unconditionally
# (dependency('libjpeg', 'jpeg')). libjpeg-turbo is cmake-only and the
# chroot has no cmake, so this is the reference implementation instead.
./configure --prefix=/usr \
    --disable-static

make
make install
