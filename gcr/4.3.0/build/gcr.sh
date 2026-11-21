# gcr 4 - certificate/key UI + gck (GNOME Shell, gnome-settings-daemon).
#
# -Dssh_agent=false: gcr's ssh agent (which replaced gnome-keyring's in
# gcr 4) only wraps OpenSSH's ssh-agent/ssh-add, and meson setup fails
# without them. OpenSSH is not part of the system; enable this again if
# it is added before gcr.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk_doc=false \
    -Dvapi=false \
    -Dintrospection=true \
    -Dgtk4=true \
    -Dcrypto=libgcrypt \
    -Dssh_agent=false \
    -Dsystemd=enabled

ninja -C build
ninja -C build install
