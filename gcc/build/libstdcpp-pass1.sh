mkdir -pv build
cd       build

../libstdc++-v3/configure           \
    --host=$SPLASHOS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$SPLASHOS_TGT/include/c++/12.2.0
    
    
make
make DESTDIR=$splash_partition_root install

rm -v $splash_partition_root/usr/lib/lib{stdc++,stdc++fs,supc++}.la