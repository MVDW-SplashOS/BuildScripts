unset {C,CPP,CXX,LD}FLAGS

echo depends bli part_gpt > grub-core/extra_deps.lst

# Fix a bug introduced in grub-2.14 (LFS 8.65)
sed 's/--image-base/--nonexist-linker-option/' -i configure

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
            
make
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions