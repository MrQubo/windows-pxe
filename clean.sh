#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


sudo umount -- "$SOURCE_DIR"/winiso/ || true
rm -- ./tftp-root/*.{bin,c32,0,iso} ./tftp-root/memdisk ./boot.wim* ./samba.conf *~ **/*~ || true
rm -r -- ./winiso/ || true
