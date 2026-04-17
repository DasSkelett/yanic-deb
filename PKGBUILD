# Maintainer: DasSkelett <dasskelett@dasskelett.dev>
pkgname=yanic
pkgver=1.9.0+batmanv1
pkgrel=2
pkgdesc='A respondd client that fetches, stores and publishes information about a Freifunk network'
arch=('amd64' 'arm64')
makedepends=('golang')
backup=('/etc/yanic.conf')
license=('AGPL-3.0')
url='https://github.com/freifunkMUC/yanic'

source=("${pkgname}-${pkgver}::https://github.com/freifunkMUC/yanic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('87250c373370dd1d1cb974881b67eeb154cadfeead14303944d29fa00d19a305')

build() {
    cd "${pkgname}-${pkgver//+/-}/"
    go build -trimpath -buildvcs=false -o "${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver//+/-}/"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 config_example.toml "${pkgdir}/etc/${pkgname}.conf"

    # install -Dm644 "contrib/init/linux-systemd/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"
}

# https://docs.makedeb.org/makedeb/pkgbuild-syntax/
# vim: set sw=4 expandtab:
