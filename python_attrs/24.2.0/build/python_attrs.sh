# attrs (Python) - libei's protocol scanner (proto/ei-scanner) imports it.
# Pure Python; installing via pip would need the hatchling/hatch-vcs build
# backends, so copy the two import packages into site-packages directly.
SITE=$(python3 -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
rm -rf "$SITE/attr" "$SITE/attrs"
cp -r src/attr src/attrs "$SITE/"
python3 -c 'import attr, attrs; print("attrs OK")'
