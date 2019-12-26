#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


declare -ra args=(
	--keep-in-foreground
	--interface=eno1
	--bind-interfaces
	# DNS
	--listen-address=192.168.42.1
	--expand-hosts
	--server=1.1.1.1
	--server=1.0.0.1
	# DHCP
	--dhcp-boot=pxelinux.0
	--dhcp-range=192.168.42.2,192.168.42.254,24h
	--dhcp-option=3,192.168.42.1  # default gateway
	--dhcp-option=6,1.1.1.1,1.0.0.1  # dns servers
	# TFTP
	--enable-tftp
	--tftp-root="$SOURCE_DIR"/tftp-root
)

sudo dnsmasq "${args[@]}"
