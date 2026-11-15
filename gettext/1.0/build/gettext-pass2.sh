# See gettext-pass1.sh: ac_cv_func_posix_spawn_file_actions_addchdir=yes
# works around the glibc 2.44 / gnulib addchdir self-recursion hang (which
# otherwise spins forever in `make check`'s test-posix_spawn-chdir,
# test-posix_spawn_file_actions_addchdir and test-execute-main).
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-1.0 \
            ac_cv_func_posix_spawn_file_actions_addchdir=yes

make
make check
make install

chmod -v 0755 /usr/lib/preloadable_libintl.so