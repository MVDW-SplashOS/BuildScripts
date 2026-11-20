# GNU which - shows the full path of commands. Not part of LFS itself
# (BLFS), but many upstream build and install scripts probe for tools with
# `which` and abort without it (e.g. squashfs-tools' man page installer).
./configure --prefix=/usr

make
make install
