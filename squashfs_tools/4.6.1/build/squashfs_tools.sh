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

# Install into /usr and use the shipped (pre-built) man pages so the build
# does not depend on help2man.
make install \
    INSTALL_PREFIX=/usr \
    INSTALL_DIR=/usr/bin \
    INSTALL_MANPAGES_DIR=/usr/share/man/man1 \
    USE_PREBUILT_MANPAGES=y
