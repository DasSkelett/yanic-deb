# Maintainer: DasSkelett <dasskelett@dasskelett.dev>
pkgname=yanic
pkgver=1.5.2
pkgrel=2
pkgdesc='A respondd client that fetches, stores and publishes information about a Freifunk network'
arch=('amd64' 'arm64')
makedepends=('golang')
backup=('/etc/yanic.conf')
license=('AGPL-3.0')
url='https://github.com/FreifunkBremen/yanic'

source=("${pkgname}-${pkgver}::https://github.com/FreifunkBremen/yanic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eeceffca031f4cbb25aac23fa642d27a3c120ac72e5a0ab80b72b83404da25e1')

build() {
    cd "${pkgname}-${pkgver}/"
    go build -trimpath -buildvcs=false -o "${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}/"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 config_example.toml "${pkgdir}/etc/${pkgname}.conf"

    # install -Dm644 "contrib/init/linux-systemd/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}

# https://docs.makedeb.org/makedeb/pkgbuild-syntax/
# vim: set sw=4 expandtab:
