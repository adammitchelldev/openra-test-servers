#!/usr/bin/env bash
set -ex

REPO=${REPO:-"adammitchelldev"}
VERSION=${VERSION:-"devtest-netcode-3"}
IMAGE=${IMAGE:-"OpenRA-Red-Alert-devel-x86_64.AppImage"}

curl -L -O "https://github.com/${REPO}/OpenRA/releases/download/${VERSION}/${IMAGE}"

chmod a+x ${IMAGE}
