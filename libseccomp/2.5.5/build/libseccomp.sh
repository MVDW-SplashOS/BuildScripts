# libseccomp - flatpak installs a seccomp filter in every sandbox
# (blocks ptrace/personality/... from apps). gperf comes from the base.
./configure --prefix=/usr --disable-static

make
make install
