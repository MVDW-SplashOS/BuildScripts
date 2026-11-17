# appstream - AppStream metadata library; libadwaita 1.5 requires it
# (About-window release/metadata parsing). The options mirror libadwaita's
# own subproject fallback (systemd/apidocs/install-docs/stemming/
# svg-support/gir) plus the remaining optional backends the stack does
# not need. Requires gperf (base) and the xmlb/libcurl/libyaml/libxml2
# libraries, all built earlier in this edition.
#
# data/meson.build also regenerates appstreamcli's own metainfo file and
# merges its translations via i18n.itstool_join - which needs the itstool
# program (and pulls libxml2's Python bindings). Nothing in this edition
# uses that metainfo, so drop the block before configuring.
python3 - <<'EOF'
p = 'data/meson.build'
s = open(p).read()
start = s.index("metainfo_with_relinfo = custom_target(")
end = s.index("# install appstream.conf default template")
open(p, 'w').write(s[:start] + s[end:])
EOF

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsystemd=false \
    -Dapidocs=false \
    -Dinstall-docs=false \
    -Dstemming=false \
    -Dsvg-support=false \
    -Dgir=false \
    -Dvapi=false \
    -Dcompose=false \
    -Dapt-support=false \
    -Dqt=false

ninja -C build
ninja -C build install
