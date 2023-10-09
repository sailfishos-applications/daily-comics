#!/bin/sh

script_dir=$(dirname "$(readlink -e "$0")")

ls -1dQ "$script_dir"/../plugins/*/cover.jpg \
  | shuf \
  | tr '\n' ' ' \
  > /tmp/covers

eval montage "$(cat /tmp/covers)" \
  -tile 10 \
  -geometry 100x100 \
  '"$script_dir"/../info/comics_covers.jpg'

rm -f /tmp/covers

