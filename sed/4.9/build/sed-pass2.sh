./configure --prefix=/usr

make
make html

#chown -Rv tester .
#su tester -c "PATH=$PATH make check"

make install

install -d -m755           /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9