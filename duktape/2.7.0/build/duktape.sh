# duktape - small embeddable JavaScript engine. polkit evaluates its
# authorization rules (/etc/polkit-1/rules.d/*.rules) with it, which
# avoids pulling SpiderMonkey into the base layer.
sed -i 's/-Os/-O2/' Makefile.sharedlibrary

make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr
make -f Makefile.sharedlibrary INSTALL_PREFIX=/usr install
