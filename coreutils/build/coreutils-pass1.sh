./configure --prefix=/usr                     \
            --host=$SPLASHOS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime

make
make DESTDIR=$splash_partition_root install

mv -v $splash_partition_root/usr/bin/chroot              $splash_partition_root/usr/sbin
mkdir -pv $splash_partition_root/usr/share/man/man8
mv -v $splash_partition_root/usr/share/man/man1/chroot.1 $splash_partition_root/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                    $splash_partition_root/usr/share/man/man8/chroot.8
