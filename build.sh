#!/bin/bash

VERSION=1.2.1

set -ex

# Prepare directories
test -d yanic && rm -r yanic
mkdir yanic

pushd yanic

mkdir -p usr/local/bin
mkdir -p DEBIAN

# control file

cat > DEBIAN/control <<EOF
Package: yanic
Version: $VERSION
Section: custom
Priority: optional
Architecture: amd64
Maintainer: DasSkelett <dasskelett@dasskelett.dev>
Homepage: https://github.com/FreifunkBremen/yanic
Description: Yanic package
 yanic is a respondd client that fetches, stores and publishes information about a Freifunk network. The goals:
 https://github.com/FreifunkBremen/yanic
EOF

# Build binary

GOBIN=`pwd`/usr/local/bin CGO_ENABLED=0 \
go install -trimpath -buildvcs=false github.com/FreifunkBremen/yanic@v$VERSION

popd

# Build deb

dpkg-deb --build yanic yanic
