#!/usr/bin/env bash
set -ex

function cleanup_func {
    sleep 0.5
    echo cleanup
}

trap "exit \$exit_code" INT TERM
trap "exit_code=\$?; cleanup_func; kill 0" EXIT

echo "Starting servers..."
ListenPort="1234" Name="Old Netcode" EnableSingleplayer="True" UseNewNetcode="False" ./launch-dedicated.sh &
ListenPort="1235" Name="New Netcode 1" EnableSingleplayer="True" UseNewNetcode="True" ./launch-dedicated.sh &
ListenPort="1236" Name="New Netcode 2" EnableSingleplayer="True" UseNewNetcode="True" ./launch-dedicated.sh &
ListenPort="1237" Name="New Netcode 3" EnableSingleplayer="True" UseNewNetcode="True" ./launch-dedicated.sh &
wait
