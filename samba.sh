#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


declare -r SAMBA_CONF="$SOURCE_DIR"/samba.conf

cat >"$SAMBA_CONF" <<-_SAMBA_CONF
	[WINISO]
	browsable = true
	read only = true
	guest ok = true
	path = "$SOURCE_DIR/winiso/"
	_SAMBA_CONF


declare -ra args=(
	--interactive
	--configfile="$SAMBA_CONF"
)

exec sudo smbd "${args[@]}"
