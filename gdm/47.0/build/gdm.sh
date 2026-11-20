# GDM - login manager, Wayland-only (no Xorg server in SplashOS). Uses the
# LFS PAM files, which already hook in pam_gnome_keyring.
getent group gdm >/dev/null || groupadd -g 21 gdm
getent passwd gdm >/dev/null || \
    useradd -c "GDM Daemon Owner" -d /var/lib/gdm -u 21 -g gdm -s /bin/false gdm
passwd -ql gdm

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgdm-xsession=false \
    -Dx11-support=false \
    -Dxdmcp=disabled \
    -Dplymouth=disabled \
    -Dselinux=disabled \
    -Dlibaudit=disabled \
    -Ddefault-pam-config=lfs \
    -Dsystemd-journal=true \
    -Dtcp-wrappers=false \
    -Dipv6=true \
    -Duser=gdm \
    -Dgroup=gdm \
    -Drun-dir=/run/gdm

ninja -C build
ninja -C build install
