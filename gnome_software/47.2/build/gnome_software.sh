# GNOME Software - graphical front-end for Flatpak, the only package
# manager. Flatpak plugin only: no PackageKit/fwupd/malcontent/snap/
# rpm-ostree, no web apps.

# help/ only builds the yelp user help via gnome.yelp, which needs
# itstool (and libxml2's Python bindings); neither is packaged and there
# is no option to turn it off, so skip it.
sed -i "/^subdir('help')$/d" meson.build
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
