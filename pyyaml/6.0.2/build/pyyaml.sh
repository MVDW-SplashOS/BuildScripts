# pyyaml - python yaml parser, hard requirement of the mesa build
# (meson.build: "Python (3.x) yaml module (PyYAML) required to build mesa").
# Without libyaml in the chroot setup.py falls back to the pure-python
# implementation with a warning - fine for codegen use. --no-build-isolation
# uses the chroot's setuptools; --no-index keeps the offline chroot honest.
python3 -m pip install --no-index --no-build-isolation --root=/ --prefix=/usr .
