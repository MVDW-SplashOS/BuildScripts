# glibc 2.44 declares posix_spawn_file_actions_addchdir only as a
# __REDIRECT_NTH alias of ..._addchdir_np, so configure's header-free symbol
# check concludes "no" and gnulib compiles its wrapper into an infinite
# self-recursion (tail-call => 100% CPU spin). Forced here; verified in
# sandbox that this yields working native addchdir semantics.
./configure --disable-shared ac_cv_func_posix_spawn_file_actions_addchdir=yes

make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin