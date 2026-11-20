# Linux-PAM - gdm requires it (password + autologin conversations) and
# gnome-keyring uses it to unlock the login keyring. shadow stays the
# non-PAM build for console login; that is fine.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddocs=disabled \
    -Daudit=disabled \
    -Dselinux=disabled \
    -Dnis=disabled \
    -Deconf=disabled \
    -Dexamples=false \
    -Dlogind=enabled \
    -Di18n=disabled

ninja -C build
ninja -C build install

# The PAM stack for SplashOS (BLFS layout). pam_unix authenticates
# against /etc/shadow; pam_systemd registers logind sessions (added by the
# systemd buildmode 2 rebuild that follows).
install -vdm755 /etc/pam.d
cat > /etc/pam.d/system-account << "PAMEOF"
account   required    pam_unix.so
PAMEOF
cat > /etc/pam.d/system-auth << "PAMEOF"
auth      required    pam_unix.so
PAMEOF
cat > /etc/pam.d/system-session << "PAMEOF"
session   required    pam_unix.so
PAMEOF
cat > /etc/pam.d/system-password << "PAMEOF"
password  required    pam_unix.so       yescrypt shadow try_first_pass
PAMEOF
cat > /etc/pam.d/other << "PAMEOF"
auth        required        pam_warn.so
auth        required        pam_deny.so
account     required        pam_warn.so
account     required        pam_deny.so
password    required        pam_warn.so
password    required        pam_deny.so
session     required        pam_warn.so
session     required        pam_deny.so
PAMEOF
chmod -v 4755 /usr/sbin/unix_chkpwd
