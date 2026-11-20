# gnome-keyring - Secret Service daemon; its PAM module (wired into
# GDM's PAM stacks by gdm's build script) unlocks the login keyring with
# the login password. ssh-agent is provided by gcr 4.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-pam-dir=/usr/lib/security \
    --enable-pam \
    --disable-ssh-agent \
    --disable-doc \
    --disable-selinux

make
make install
