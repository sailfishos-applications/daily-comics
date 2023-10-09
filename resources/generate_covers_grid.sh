#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -e "$0")")

ls -1Q "${SCRIPT_DIR}"/../plugins/*/cover.jpg \
  | shuf \
  > /tmp/covers

montage $(cat /tmp/covers) \
  -tile 10 \
  -geometry 100x100 \
  "${SCRIPT_DIR}"/../info/comics_covers.jpg

rm -f /tmp/covers

