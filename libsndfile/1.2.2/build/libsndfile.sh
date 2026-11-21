# libsndfile - required by the PulseAudio client library.
# No external codecs (FLAC/Opus/MP3): only the client API is used.
#
# -std=gnu17: GCC >= 15 defaults to C23, where bool/true/false are
# keywords, and 1.2.2's ALAC codec defines its own
# `typedef enum { false = 0, true = 1 } bool;` ("cannot use keyword
# 'false' as enumeration constant"). Fixed upstream after 1.2.2.
./configure --prefix=/usr \
    --disable-static \
    --disable-external-libs \
    --disable-mpeg \
    --disable-full-suite \
    CFLAGS="${CFLAGS:--O2 -g} -std=gnu17"

make
make install
