# systemd, buildmode 2 (desktop-gnome) - rebuild WITH PAM, after
# linux-pam. pam_systemd.so is what registers a GDM/GNOME login as a logind
# session (seat + DRM/input device access for Wayland); without it the
# session cannot start. Differences from mode 1 (systemd-pass1.sh):
#   - -Dpam=enabled, -Dpamconfdir=/etc/pam.d (installs systemd-user)
#   - does NOT rewrite /etc/os-release, re-run machine-id setup or
#     `systemctl preset-all` (that would reset what earlier layers enabled)
#   - no man pages (already installed by mode 1)
sed -i -e 's/GROUP="render"/GROUP="video"/' \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in

meson setup build-pam \
      --prefix=/usr                 \
      --buildtype=release           \
      -Ddefault-dnssec=no           \
      -Dfirstboot=false             \
      -Dinstall-tests=false         \
      -Dldconfig=false              \
      -Dsysusers=false              \
      -Drpmmacrosdir=no             \
      -Dhomed=disabled              \
      -Duserdb=false                \
      -Dman=disabled                \
      -Dmode=release                \
      -Dpam=enabled                 \
      -Dpamconfdir=/etc/pam.d       \
      -Ddev-kvm-mode=0660           \
      -Dnobody-group=nogroup        \
      -Dsysupdate=disabled          \
      -Dukify=disabled              \
      -Ddocdir=/usr/share/doc/systemd-261.2

ninja -C build-pam
ninja -C build-pam install

grep -q pam_systemd /etc/pam.d/system-session || cat >> /etc/pam.d/system-session << "PAMEOF"
session  required    pam_loginuid.so
session  optional    pam_systemd.so
PAMEOF
