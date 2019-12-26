#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


# Configure eno1 connection.
sudo ip link set dev eno1 up
sudo ip addr add 192.168.42.1/24 dev eno1 || true

# Forward connections between eno1 and wlp3s0.
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
printf '%s\n' 'iptables -t nat -'{D,A}' POSTROUTING -o wlp3s0 -j MASQUERADE' | xargs -L1 sudo || true
printf '%s\n' 'iptables -'{D,A}' FORWARD -i wlp3s0 -o eno1 -m state --state RELATED,ESTABLISHED -j ACCEPT' | xargs -L1 sudo || true
printf '%s\n' 'iptables -'{D,A}' FORWARD -i eno1 -o wlp3s0 -j ACCEPT' | xargs -L1 sudo || true
