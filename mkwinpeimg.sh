#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

declare -r SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$SOURCE_DIR"


declare -r WINISO_MNT="$SOURCE_DIR"/winiso/
declare -r START_SCRIPT="$SOURCE_DIR"/start.cmd
declare -r WINPE_OUT="$SOURCE_DIR"/tftp-root/winpe.iso

mkwinpeimg --iso --windows-dir="$WINISO_MNT" --start-script="$START_SCRIPT" "$WINPE_OUT"

# clean()
# {
#         if [ -e "$SOURCE_DIR"/mnt/ ]
#         then
#                 sudo umount "$SOURCE_DIR"/mnt/ || true
#                 rm -r -- "$SOURCE_DIR"/mnt/
#         fi
#         if [ -e "$SOURCE_DIR"/boot.wim ]
#         then
#                 chmod u+w "$SOURCE_DIR"/boot.wim
#                 # rm -- "$SOURCE_DIR"/boot.wim
#         fi
#         return 0
# }
# trap clean EXIT
# clean
#
# mkdir -p -- "$SOURCE_DIR"/mnt/
# sudo mount -o loop,ro --source "$WINPE_OUT" --target "$SOURCE_DIR"/mnt/
# cp "$SOURCE_DIR"/mnt/sources/boot.wim "$SOURCE_DIR"/boot.wim
# chmod u+w "$SOURCE_DIR"/boot.wim
# sudo umount "$SOURCE_DIR"/mnt/
# rm -r -- "$SOURCE_DIR"/mnt/
#
# wimoptimize --include-integrity --recompress --solid --solid-compress=maximum:100 --not-pipable \
#         "$SOURCE_DIR"/boot.wim
# mkwinpeimg --iso --windows-dir="$WINISO_MNT" --start-script="$START_SCRIPT" --wim="$SOURCE_DIR"/boot.wim \
#         "$WINPE_OUT"
# rm "$SOURCE_DIR"/boot.wim*
