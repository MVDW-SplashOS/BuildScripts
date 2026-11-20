# p11-kit - PKCS#11 module loader and the system trust store (trust
# module, anchors in /etc/pki/anchors written by make-ca). gnutls,
# glib-networking and NSS read CA certificates through it.
#
# trust-extract-compat (update-ca-certificates) is pointed at make-ca, as
# in BLFS.
sed '20,$ d' -i trust/trust-extract-compat
cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtrust_paths=/etc/pki/anchors \
    -Dtest=false \
    -Dman=false \
    -Dgtk_doc=false \
    -Dbash_completion=disabled

ninja -C build
ninja -C build install

ln -sfv /usr/libexec/p11-kit/trust-extract-compat /usr/bin/update-ca-certificates
ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
