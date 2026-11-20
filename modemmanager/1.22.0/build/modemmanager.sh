# ModemManager - mobile broadband; Settings' WWAN panel requires mm-glib.
# AT/serial modems only (no MBIM/QMI/QRTR libraries yet).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dmbim=false \
    -Dqmi=false \
    -Dqrtr=false \
    -Dintrospection=true \
    -Dvapi=false \
    -Dbash_completion=false \
    -Dman=false \
    -Dtests=false \
    -Dexamples=false

ninja -C build
ninja -C build install

systemctl enable ModemManager.service || true
