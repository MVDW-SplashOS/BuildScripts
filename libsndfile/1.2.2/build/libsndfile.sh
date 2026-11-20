# libsndfile - required by the PulseAudio client library.
# No external codecs (FLAC/Opus/MP3): only the client API is used.
./configure --prefix=/usr \
    --disable-static \
    --disable-external-libs \
    --disable-mpeg \
    --disable-full-suite

make
make install
