#!/usr/bin/env bash
set -ex

REPO=${REPO:-"adammitchelldev"}
VERSION=${VERSION:-"devtest-netcode-2"}
IMAGE=${IMAGE:-"OpenRA-Red-Alert-devel-x86_64.AppImage"}

curl -O "https://github.com/${REPO}/OpenRA/releases/download/${VERSION}/${IMAGE}"

chmod a+x ${IMAGE}
