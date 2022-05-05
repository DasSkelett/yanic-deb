# Maintainer: DasSkelett <dasskelett@dasskelett.dev>
pkgname=yanic
pkgver=1.2.1
pkgrel=1
pkgdesc='A respondd client that fetches, stores and publishes information about a Freifunk network'
arch=('amd64' 'arm64')
makedepends=('golang')
backup=('/etc/yanic.conf')
license=('AGPL-3.0')
url='https://github.com/FreifunkBremen/yanic'

source=("${pkgname}-${pkgver}::https://github.com/FreifunkBremen/yanic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eb677f911cfa60f49d255a8f795ea84955fc1390d365b291457bdfa5e2491c82')

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
