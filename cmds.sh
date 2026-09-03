pacman -Suy --needed --noconfirm base-devel devtools time

. PKGBUILD ; pacman -Suy "${makedepends[@]}" "${depends[@]}"

ls -1 --color=no pkgs/*/PKGBUILD | xargs -rn1 -IX bash -c 'source X; pacman -Suy --needed --noconfirm "${makedepends[@]}" "${depends[@]}"'

echo 'MAKEFLAGS=-j10' > /etc/makepkg.conf.d/parallel.conf

export LANG=C.UTF-8 LC_ALL=C.UTF-8 BUILDDIR=/host/tmp/ PKGDEST=/host/tmp/ SRCDEST=/host/tmp/ VERBOSE=1

mkdir /build
groupadd -g 1234 builder && useradd -d /build -M -u 1234 -g 1234 builder
chown 1234:1234 /build

time nice -n20 su -m builder -c 'makepkg -C -f' 2>&1 | tee /host/tmp/build.log

repo-add -n -R ./wolfpkg.db.tar.zst */*.pkg.tar.zst
