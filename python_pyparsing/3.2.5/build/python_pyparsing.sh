# pyparsing (Python) - flatpak's build runs variant-schema-compiler
# (from the bundled libglnx/variant-schema-compiler subproject) at build
# time, and meson setup fails without the module. Pure Python, built with
# the flit_core backend from the molecule base (same as LFS's Python
# modules).
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --no-user --find-links dist pyparsing

python3 -c 'import pyparsing; print("pyparsing", pyparsing.__version__)'
