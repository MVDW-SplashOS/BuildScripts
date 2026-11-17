# mesa - meson build. Software rendering only: softpipe is the LLVM-free
# gallium driver (llvmpipe would require an LLVM build). Wayland/EGL/GBM
# platform for cage + GTK; no GLX/X11, no vulkan, no hardware drivers.
# python mako + pyyaml must be installed before (both are meson setup
# hard requirements).
#
# 25.0.1 rather than 24.3.4: glibc >= 2.41 ships its own C11 threads
# (stdlib.h declares once_flag/call_once), which conflicts with the
# vendored src/c11 shim 24.3.4 still compiled. 25.0.1 uses the system
# <threads.h> when the libc provides thrd_create (with_c11_threads) and
# drops threads_posix.c from the build.
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
