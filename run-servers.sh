#!/usr/bin/env bash
set -ex

function cleanup_func {
    sleep 0.5
    echo cleanup
}

trap "exit \$exit_code" INT TERM
trap "exit_code=\$?; cleanup_func; kill 0" EXIT

function start_server {
    ./${IMAGE} --server Server.ListenPort="$1" Server.Name="$2" Server.EnableSingleplayer="True" Server.UseNewNetcode="{$3:-True}" &
}

IMAGE=${IMAGE:-"OpenRA-Red-Alert-devel-x86_64.AppImage"}

echo "Starting servers..."
start_server "1234" "adamm: Old Netcode" "False"
start_server "1235" "adamm: New Netcode 1"
start_server "1236" "adamm: New Netcode 2"
wait
