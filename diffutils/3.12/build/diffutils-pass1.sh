# gl_cv_func_strcasecmp_works=yes: the strcasecmp check runs a test program,
# which is impossible while cross-compiling (and has no fallback value).
# Glibc's strcasecmp works fine, so pre-seed the result like LFS does.
./configure --prefix=/usr   \
            --host=$SPLASHOS_TGT \
            gl_cv_func_strcasecmp_works=yes \
            --build=$(./build-aux/config.guess)
make
make DESTDIR=$splash_partition_root install
