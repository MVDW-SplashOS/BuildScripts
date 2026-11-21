# gcr 3 (gck-1, gcr-base-3) - gnome-keyring 46 still links it. No GTK3
# UI parts, no ssh-agent (gcr 4 provides that).
# gcr 3.41.2 calls .path() on the ssh-add/ssh-agent lookups even when
# -Dssh_agent=false made them optional, so meson setup fails without
# OpenSSH ("Unable to get the path of a not-found external program").
# Only take the path when the program was found; the paths are used by
# the ssh-agent sources alone, which are not built here.
sed -i \
    -e "s/^ssh_add_path = find_program('ssh-add', required: get_option('ssh_agent')).path()$/ssh_add_prog = find_program('ssh-add', required: get_option('ssh_agent'))\nssh_add_path = ssh_add_prog.found() ? ssh_add_prog.full_path() : ''/" \
    -e "s/^ssh_agent_path = find_program('ssh-agent', required: get_option('ssh_agent')).path()$/ssh_agent_prog = find_program('ssh-agent', required: get_option('ssh_agent'))\nssh_agent_path = ssh_agent_prog.found() ? ssh_agent_prog.full_path() : ''/" \
    meson.build

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk_doc=false \
    -Dintrospection=false \
    -Dgtk=false \
    -Dssh_agent=false \
    -Dsystemd=disabled

ninja -C build
ninja -C build install
