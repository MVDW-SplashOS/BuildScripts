# hwdata - hardware identification database (pnp.ids, pci.ids). wlroots'
# DRM backend requires the hwdata pkg-config file to locate pnp.ids, and
# libdisplay-info generates its PNP id table from the same file.
#
# The upstream Makefile wants a ./configure dance (RPM spec version
# parsing) for what is a data-only package, so install the ID files and
# generate the pkg-config file directly.
mkdir -p /usr/share/hwdata /usr/lib/pkgconfig
install -m 644 pnp.ids pci.ids /usr/share/hwdata/

sed -e "s|@prefix@|/usr|g" \
    -e "s|@datadir@|/usr/share|g" \
    -e "s|@pkgdatadir@|/usr/share/hwdata|g" \
    -e "s|@VERSION@|0.390|g" \
    -e "s|@NAME@|hwdata|g" \
    hwdata.pc.in > /usr/lib/pkgconfig/hwdata.pc

pkg-config --variable=pkgdatadir hwdata
