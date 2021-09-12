# WayDroid build

Images used to build packages for waydroid

Currently available images:

 - `mrcyjanek/waydroid:ubuntu.20-04` (focal)
 - `mrcyjanek/waydroid:debian.11` (bullseye)
 - `mrcyjanek/waydroid:debian.12` (bookworm)
 - `mrcyjanek/waydroid:ubuntu.21-04` (hirsute)
 - `mrcyjanek/waydroid:ubuntu.21-10` (impish) [(broken)](https://www.mail-archive.com/ubuntu-bugs@lists.ubuntu.com/msg5953736.html)

Currently the images are built for:
 - `linux/amd64`
 - `linux/arm64`

If you are on i386/arm device please open an issue.

### `.abstruse.yml`

This is the `.abstruse.yml` that we use to build the software.

```yml
image: mrcyjanek/waydroid:ubuntu.20-04
matrix:
 - env: DISTRO=focal
   image: mrcyjanek/waydroid:ubuntu.20-04
 - env: DISTRO=bullseye
   image: mrcyjanek/waydroid:debian.11
 - env: DISTRO=bookworm
   image: mrcyjanek/waydroid:debian.12
 - env: DISTRO=hirsute
   image: mrcyjanek/waydroid:ubuntu.21-04
script:
 - apt update
 - build_changelog
 - mk-build-deps -ir -t "apt-get -o Debug::pkgProblemResolver=yes -y --no-install-recommends"
 - debuild -b -uc -us
 - mkdir -p /apt/$DISTRO/ || true
 - mv ../*.deb /apt/$DISTRO/
```
