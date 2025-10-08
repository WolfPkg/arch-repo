pacman -Suy --needed base-devel devtools time
echo 'MAKEFLAGS=-j10' > /etc/makepkg.conf.d/parallel.conf
BUILDDIR=/host/tmp/ PKGDEST=/host/tmp/ SRCDEST=/host/tmp/ time nice -n20 sudo -E -u nobody makepkg -C -f 2>&1 | tee /host/tmp/build.log
