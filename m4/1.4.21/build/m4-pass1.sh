# Same glibc 2.44 / gnulib posix_spawn_file_actions_addchdir workaround as in
# m4-pass2.sh; m4 itself never calls it at runtime, but the broken function
# still gets compiled into the binary (see the comment there for details).
./configure --prefix=/usr   \
            --host=$SPLASHOS_TGT \
            --build=$(build-aux/config.guess) \
            ac_cv_func_posix_spawn_file_actions_addchdir=yes \
            ac_cv_func_posix_spawn_file_actions_addfchdir=yes

make
make DESTDIR=$splash_partition_root install