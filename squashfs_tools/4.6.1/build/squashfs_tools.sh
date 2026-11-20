# squashfs-tools - mksquashfs/unsquashfs. Used by splash-appimage to
# inspect and repack AppImages without mounting them.
#
# The archive's top level is squashfs-tools-4.6.1/ and the actual sources
# (with the Makefile) live in its squashfs-tools/ subdirectory.
cd squashfs-tools

# Match the compressors AppImages actually use: gzip (the classic
# AppImage type-2 default), xz, lz4 and zstd. LZO is not packaged, so it
# stays disabled. zlib/xz/lz4/zstd were built earlier in the base chain.
make -j"$(nproc)" \
    GZIP_SUPPORT=1 \
    XZ_SUPPORT=1 \
    LZ4_SUPPORT=1 \
    ZSTD_SUPPORT=1 \
    LZO_SUPPORT=0

# Install by hand instead of `make install`: its last step runs
# generate-manpages/install-manpages.sh, which sources functions.sh and
# aborts when `which` is missing (the system does not ship it), even when
# man page installation is disabled. These are the same files the install
# target copies, plus the pre-built man pages from the archive (no
# help2man needed).
install -v -d -m755 /usr/bin /usr/share/man/man1
install -v -m755 mksquashfs unsquashfs /usr/bin
ln -sfv unsquashfs /usr/bin/sqfscat
ln -sfv mksquashfs /usr/bin/sqfstar
install -v -m644 ../manpages/mksquashfs.1 ../manpages/unsquashfs.1 \
    ../manpages/sqfscat.1 ../manpages/sqfstar.1 /usr/share/man/man1
