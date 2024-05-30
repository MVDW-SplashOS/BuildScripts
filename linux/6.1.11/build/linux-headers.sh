make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $splash_partition_root/usr