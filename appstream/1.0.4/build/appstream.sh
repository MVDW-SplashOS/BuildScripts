# appstream - AppStream metadata library; libadwaita 1.5 requires it
# (About-window release/metadata parsing). The options mirror libadwaita's
# own subproject fallback (systemd/apidocs/install-docs/stemming/
# svg-support/gir) plus the remaining optional backends the stack does
# not need. Requires gperf (base) and the xmlb/libcurl/libyaml/libxml2
# libraries, all built earlier in this edition.
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
