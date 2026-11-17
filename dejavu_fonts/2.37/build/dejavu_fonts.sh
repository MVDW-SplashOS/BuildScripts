# dejavu-fonts-ttf - DejaVu Sans (TTF). The graphical boot picker needs at
# least one font: without a font, Pango/GTK 4.16 computes garbage window
# geometry from the label layout and the UI aborts at its first frame
# ('Unable to create Cairo image surface: invalid value (typically too
# big)'; reproduced locally with an empty fontconfig).
#
# The prebuilt TTFs ship inside the release tarball - install them
# directly. fontconfig's default config scans /usr/share/fonts.
mkdir -p /usr/share/fonts/dejavu
install -m 644 \
    ttf/DejaVuSans.ttf \
    ttf/DejaVuSans-Bold.ttf \
    /usr/share/fonts/dejavu/

ls -l /usr/share/fonts/dejavu/
