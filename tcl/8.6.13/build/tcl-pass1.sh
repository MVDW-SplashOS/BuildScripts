SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr           \
            --mandir=/usr/share/man

make

echo "SPLASH_TCL_DEBUG: 1"

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.5|/usr/lib/tdbc1.1.5|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.5|/usr/include|"            \
    -i pkgs/tdbc1.1.5/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.3|/usr/lib/itcl4.2.3|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.3/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.3|/usr/include|"            \
    -i pkgs/itcl4.2.3/itclConfig.sh

unset SRCDIR

echo "SPLASH_TCL_DEBUG: 2"

make install

echo "SPLASH_TCL_DEBUG: 3"

chmod -v u+w /usr/lib/libtcl8.6.so

echo "SPLASH_TCL_DEBUG: 4"

make install-private-headers

echo "SPLASH_TCL_DEBUG: 5"

ln -sfv tclsh8.6 /usr/bin/tclsh

echo "SPLASH_TCL_DEBUG: 6"

mv /usr/share/man/man3/{Thread,Tcl_Thread}.3

echo "SPLASH_TCL_DEBUG: 7"

cd ..
tar -xf ../tcl_docs-8.6.13.tar.xz --strip-components=1

echo "SPLASH_TCL_DEBUG: 8"

mkdir -v -p /usr/share/doc/tcl-8.6.13
cp -v -r  ./html/* /usr/share/doc/tcl-8.6.13

echo "SPLASH_TCL_DEBUG: 9"