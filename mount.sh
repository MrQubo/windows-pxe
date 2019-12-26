#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


declare -r ISO="${1-$HOME/VirtualBox VMs/images/Win10_1809Oct_Polish_x64.iso}"
mkdir -p -- "$SOURCE_DIR"/winiso/
exec sudo mount -o loop,ro "$ISO" "$SOURCE_DIR"/winiso/
