rm -v man3/crypt*

# -R: man-pages' build system does not work with make's built-in variables
# and hard-errors without it; GIT=false silences git warnings (LFS 8.3)
make -R GIT=false prefix=/usr install