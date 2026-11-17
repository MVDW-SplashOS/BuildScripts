# mako - python template engine required by the mesa build (meson codegen)
# Installed from the extracted source tree. --no-build-isolation uses the
# setuptools/wheel already present in the chroot (molecule base) instead of
# trying to fetch build deps from PyPI; --no-index makes that intent explicit
# (the chroot is offline, any network access must fail fast, not hang).
python -m pip install --no-index --no-build-isolation --root=/ --prefix=/usr .
