# mesa - meson build. Software rendering only: softpipe is the LLVM-free
# gallium driver (llvmpipe would require an LLVM build). Wayland/EGL/GBM
# platform for cage + GTK; no GLX/X11, no vulkan, no hardware drivers.
# python mako + markupsafe must be installed before (mako package).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgallium-drivers=softpipe \
    -Dllvm=disabled \
    -Dplatforms=wayland \
    -Dglx=disabled \
    -Degl=enabled \
    -Dgbm=enabled \
    -Dgles1=disabled \
    -Dvulkan-drivers= \
    -Dglvnd=disabled \
    -Dbuild-tests=false

ninja -C build
ninja -C build install
