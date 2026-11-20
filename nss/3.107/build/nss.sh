# NSS - crypto/S-MIME library; evolution-data-server (GNOME Shell's
# calendar backend) hard-requires it. Upstream has no install target and
# no nss.pc, so install by hand (BLFS layout) and write the .pc file.
cd nss

make BUILD_OPT=1 \
     NSPR_INCLUDE_DIR=/usr/include/nspr \
     USE_SYSTEM_ZLIB=1 \
     ZLIB_LIBS=-lz \
     NSS_ENABLE_WERROR=0 \
     NSS_DISABLE_GTESTS=1 \
     USE_64=1 \
     NSS_USE_SYSTEM_SQLITE=1

cd ../dist
install -v -m755 Linux*/lib/*.so /usr/lib
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib
install -v -m755 -d /usr/include/nss
cp -v -RL {public,private}/nss/* /usr/include/nss
install -v -m755 Linux*/bin/{certutil,pk12util} /usr/bin

NSS_VER=3.107
NSPR_VER=$(pkg-config --modversion nspr)
cat > /usr/lib/pkgconfig/nss.pc << NSSEOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include/nss

Name: NSS
Description: Network Security Services
Version: ${NSS_VER}
Requires: nspr >= ${NSPR_VER}
Libs: -L\${libdir} -lssl3 -lsmime3 -lnss3 -lnssutil3
Cflags: -I\${includedir}
NSSEOF

# Let NSS use the p11-kit system trust store.
ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
