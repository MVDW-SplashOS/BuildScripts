# GNOME Software - graphical front-end for Flatpak, the only package
# manager. Flatpak plugin only: no PackageKit/fwupd/malcontent/snap/
# rpm-ostree, no web apps.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dflatpak=true \
    -Dpackagekit=false \
    -Dfwupd=false \
    -Dmalcontent=false \
    -Dsnap=false \
    -Dapt=false \
    -Drpm_ostree=false \
    -Deos_updater=false \
    -Dwebapps=false \
    -Dhardcoded_foss_webapps=false \
    -Dhardcoded_proprietary_webapps=false \
    -Dexternal_appstream=false \
    -Dgudev=true \
    -Dpolkit=true \
    -Dsoup2=false \
    -Dsysprof=disabled \
    -Dtests=false \
    -Dman=false \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
