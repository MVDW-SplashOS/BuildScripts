# gcr 4 - certificate/key UI + gck (GNOME Shell, gnome-settings-daemon).
# The ssh-agent moved from gnome-keyring to gcr 4; keep it (systemd user
# unit gcr-ssh-agent.socket).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk_doc=false \
    -Dvapi=false \
    -Dintrospection=true \
    -Dgtk4=true \
    -Dcrypto=libgcrypt \
    -Dssh_agent=true \
    -Dsystemd=enabled

ninja -C build
ninja -C build install
