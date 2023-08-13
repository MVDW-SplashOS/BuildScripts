sed -e '/ifdef SIGPIPE/,+2 d' \
    -e '/undef  FATAL_SIG/i FATAL_SIG (SIGPIPE);' \
    -i src/main.c

./configure --prefix=/usr   \
            --without-guile \
            --host=$SPLASHOS_TGT \
            --build=$(build-aux/config.guess)

make
make DESTDIR=$splash_partition_root install