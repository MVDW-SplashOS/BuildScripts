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
# drops threads_posix.c from the build - but upstream gates that path
# to Android only ("if with_platform_android"), so on glibc the vendored
# shim still conflicts. Open the gate on any system where thrd_create
# exists (the exact line is unique in meson.build; after the rewrite the
# pattern no longer matches, so the sed is a no-op on a re-run).
sed -i 's/^  if with_platform_android$/  if true/' meson.build

# With the system C11 threads enabled, glibc's mtx_t is an opaque union
# (layout-identical to pthread_mutex_t but a distinct C type), and
# cnd_monotonic.c passes the C11 mtx_t straight to pthread_cond_wait/
# timedwait. Upstream only exercises this path on Android (plain typedef)
# so it never noticed. Cast to the pthread type - the unions are
# bit-compatible (this is what glibc's own cnd_timedwait does internally).
sed -i 's|pthread_cond_timedwait(&cond->cond, mtx, abs_time)|pthread_cond_timedwait(\&cond->cond, (pthread_mutex_t *)mtx, abs_time)|' src/util/cnd_monotonic.c
sed -i 's|pthread_cond_wait(&cond->cond, mtx)|pthread_cond_wait(\&cond->cond, (pthread_mutex_t *)mtx)|' src/util/cnd_monotonic.c

# Same union/type mismatch in egl_dri2.c: the only pthread call on a C11
# cnd_t in the tree (the rest of the file uses the C11 API, and glibc's
# own C11 wrappers cast the union the same way).
sed -i 's|pthread_cond_init(&dri2_sync->cond, &attr)|pthread_cond_init((pthread_cond_t *)\&dri2_sync->cond, \&attr)|' src/egl/drivers/dri2/egl_dri2.c

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
