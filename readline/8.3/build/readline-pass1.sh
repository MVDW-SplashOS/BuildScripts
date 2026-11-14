sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

# Prevent hard coding library search paths (rpath) into the shared libraries
sed -i 's/-Wl,-rpath,[^ ]*//' support/shobj-conf

# Fix a problem identified upstream specifically for this version of readline
# (replaces the old 8.2-era upstream_fixes patch, LFS 8.12)
sed -e '270a\
else\
chars_avail = 1;'      \
-e '288i\   result = -1;' \
-i.orig input.c

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.3

make SHLIB_LIBS="-lncursesw"

make SHLIB_LIBS="-lncursesw" install

install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.3