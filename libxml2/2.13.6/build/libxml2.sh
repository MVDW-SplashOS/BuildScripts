# libxml2 - meson build; python bindings off (wayland-scanner only needs C).
#
# meson.build runs `run_command('git', 'describe', check: false)` to sniff
# a -GIT version suffix. Even with check:false meson still requires the
# program to exist, and the chroot has no git. Shim a failing git so the
# run_command returns non-zero, exactly like not being in a git repo -
# the build then proceeds with an empty version suffix.
mkdir -p "$PWD/.shim"
printf '#!/bin/sh\nexit 1\n' > "$PWD/.shim/git"
chmod +x "$PWD/.shim/git"
export PATH="$PWD/.shim:$PATH"

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dpython=false

ninja -C build
ninja -C build install
