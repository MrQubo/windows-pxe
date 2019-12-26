#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


sudo pkill dnsmasq || true
sudo pkill smbd || true
