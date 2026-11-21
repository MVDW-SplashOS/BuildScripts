# xdg-desktop-portal-gnome - GNOME implementation of the portals.

# xdg-desktop-portal 1.20 annotates impl.portal.Notification.AddNotification
# with org.gtk.GDBus.C.UnixFD, so gdbus-codegen now passes a GUnixFDList to
# the handle-add-notification handler and complete_add_notification takes
# one. 47.1 predates that: the complete call fails to build, and the
# handler (connected untyped via g_signal_connect) would get its arguments
# shifted. Add the parameter and complete without returning fds.
python3 - <<'EOF'
p = 'src/notification.c'
s = open(p).read()
old_sig = ("handle_add_notification (XdpImplNotification *object,\n"
           "                         GDBusMethodInvocation *invocation,\n")
old_done = "xdp_impl_notification_complete_add_notification (object, invocation);"
assert s.count(old_sig) == 1 and s.count(old_done) == 1, "notification.c changed"
s = s.replace(old_sig, old_sig + "                         GUnixFDList *fd_list,\n")
s = s.replace(old_done, "xdp_impl_notification_complete_add_notification (object, invocation, NULL);")
open(p, 'w').write(s)
EOF

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsystemd=enabled

ninja -C build
ninja -C build install
