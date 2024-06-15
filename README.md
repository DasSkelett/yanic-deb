# yanic Debian package

A Debian/Ubuntu package for [yanic](https://github.com/FreifunkBremen/yanic)

Built using [makedeb](https://makedeb.org/)


## Updating

1) Update the `pkgver` and `pkgrel` variables in the PKGBUILD
2) Run `makedeb -g` and update the `sha256sums` variable in the PKGBUILD
3) Run `makedeb --print-srcinfo > .SRCINFO`
