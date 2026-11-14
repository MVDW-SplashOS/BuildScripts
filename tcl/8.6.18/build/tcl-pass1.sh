SRCDIR=$(pwd)
cd unix

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --disable-rpath

make

# Remove references to the build directory from the config files and
# replace them with the install directories (LFS 8.17)
sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.13|/usr/lib/tdbc1.1.13|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.13/generic|/usr/include|"     \
    -e "s|$SRCDIR/pkgs/tdbc1.1.13/library|/usr/lib/tcl8.6|"  \
    -e "s|$SRCDIR/pkgs/tdbc1.1.13|/usr/include|"             \
    -i pkgs/tdbc1.1.13/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.3.7|/usr/lib/itcl4.3.7|" \
    -e "s|$SRCDIR/pkgs/itcl4.3.7/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.3.7|/usr/include|"            \
    -i pkgs/itcl4.3.7/itclConfig.sh

unset SRCDIR

make install

chmod 644 /usr/lib/libtclstub8.6.a

# Make the installed library writable so debugging symbols can be removed later
chmod -v u+w /usr/lib/libtcl8.6.so

# Tcl headers, needed by the next package (Expect)
make install-private-headers

ln -sfv tclsh8.6 /usr/bin/tclsh

# Rename a man page that conflicts with a Perl man page; guard so a task
# re-run (recovery) does not fail when the file was already renamed
if [ -f /usr/share/man/man3/Thread.3 ]; then
    mv -v /usr/share/man/man3/{Thread,Tcl_Thread}.3
fi

cd ..
tar -xf ../tcl_docs-8.6.18.tar.xz --strip-components=1

mkdir -v -p /usr/share/doc/tcl-8.6.18
cp -v -r  ./html/* /usr/share/doc/tcl-8.6.18
