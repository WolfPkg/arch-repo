Add to `/etc/pacman.conf`:
```
[wolfpkg]
SigLevel = Optional TrustAll
Server = https://wolfpkg.pjj.cc/d/archlinux/$arch
```

Or, if `pacman.conf` contains `Include = /etc/pacman.d/*.conf` then create a new file `/etc/pacman.d/wolfpkg.conf` with those 3 lines.
