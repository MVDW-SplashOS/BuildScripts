# glibc >= 2.44 declares posix_spawn_file_actions_addchdir in <spawn.h> as an
# asm alias of the *_np symbol but exports no symbol under the standard name.
# m4-1.4.21's bundled gnulib then probes it as missing and compiles its own
# replacement, which ends up calling itself -> endless loop (100% CPU hang in
# make check: test-execute.sh case 21, test-posix_spawn-chdir,
# test-posix_spawn_file_actions_addchdir).
# Forcing the probe result makes gnulib build its wrapper as rpl_* and forward
# to the working glibc posix_spawn_file_actions_addchdir_np.
# See https://lists.gnu.org/archive/html/bug-gnulib/2026-07/msg00164.html and
# https://sourceware.org/bugzilla/show_bug.cgi?id=34437
./configure --prefix=/usr \
            ac_cv_func_posix_spawn_file_actions_addchdir=yes \
            ac_cv_func_posix_spawn_file_actions_addfchdir=yes

make
make check
make install
