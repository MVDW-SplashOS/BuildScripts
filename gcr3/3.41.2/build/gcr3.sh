# gcr 3 (gck-1, gcr-base-3, gcr-3) - gnome-keyring 46 still links it.
# The GTK3 UI library (gcr-3) is built too: gnome-keyring's configure
# requires gcr-3 (its `gnome-keyring` tool uses it for import/trust), and
# GTK3 is built earlier in the chain. No ssh-agent: it only wraps OpenSSH,
# which is not part of the system.
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
    -Dgtk=true \
    -Dssh_agent=false \
    -Dsystemd=disabled

ninja -C build
ninja -C build install
