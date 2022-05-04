#!/bin/bash

VERSION=1.2.1

set -ex

pushd yanic

# Prepare directories
test -d usr/local/bin && rm -r usr/local/bin
mkdir -p usr/local/bin
mkdir -p DEBIAN

cat > DEBIAN/control <<EOF
Package: yanic
Version: $VERSION
Section: custom
Priority: optional
Architecture: amd64
Maintainer: Annika Wickert <aw@awlnx.space>
Description: Yanic package
 yanic is a respondd client that fetches, stores and publishes information about a Freifunk network. The goals:
 https://github.com/FreifunkBremen/yanic
EOF

GOBIN=`pwd`/usr/local/bin CGO_ENABLED=0 \
go install -trimpath -buildvcs=false github.com/FreifunkBremen/yanic@v$VERSION

popd

dpkg-deb --build yanic yanic
