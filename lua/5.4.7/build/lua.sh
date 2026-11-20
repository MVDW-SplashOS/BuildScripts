# Lua 5.4 - WirePlumber scripts its policy in Lua (system-lua, so its
# meson subproject never needs network access).
cat > lua.pc << "LUAEOF"
V=5.4
R=5.4.7

prefix=/usr
INSTALL_BIN=${prefix}/bin
INSTALL_INC=${prefix}/include
INSTALL_LIB=${prefix}/lib
INSTALL_MAN=${prefix}/share/man/man1
INSTALL_LMOD=${prefix}/share/lua/${V}
INSTALL_CMOD=${prefix}/lib/lua/${V}
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: Lua
Description: An Extensible Extension Language
Version: ${R}
Requires:
Libs: -L${libdir} -llua -lm -ldl
Cflags: -I${includedir}
LUAEOF

# Upstream only builds a static liblua; build it position-independent and
# link a shared library from it.
make linux MYCFLAGS="-fPIC"
make INSTALL_TOP=/usr \
     INSTALL_MAN=/usr/share/man/man1 \
     TO_LIB="liblua.a" \
     install
gcc -shared -o /usr/lib/liblua.so.5.4.7 -Wl,-soname,liblua.so.5.4 \
    -Wl,--whole-archive src/liblua.a -Wl,--no-whole-archive -lm -ldl
ln -sfv liblua.so.5.4.7 /usr/lib/liblua.so.5.4
ln -sfv liblua.so.5.4 /usr/lib/liblua.so
install -v -m644 -D lua.pc /usr/lib/pkgconfig/lua.pc
