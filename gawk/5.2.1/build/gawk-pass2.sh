sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make
make LN='ln -f' install

mkdir -pv                                   /usr/share/doc/gawk-5.2.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.2.1
