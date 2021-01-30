# Maintainer: Duologic <jeroen@simplistic.be>

pkgname=zoom-docker
pkgver=0.0.1
pkgrel=0
pkgdesc=".desktop file for running Zoom in Docker"
arch=('x86_64')
license=('MIT')
optdepends=('xdg-utils')
source=('ZoomDocker.desktop'
        'zoom')
sha512sums=('SKIP' 'SKIP')

package() {
    install -Dm755 zoom "$pkgdir"/usr/bin/zoom
    install -Dm644 ZoomDocker.desktop "$pkgdir"/usr/share/applications/ZoomDocker.desktop
}
