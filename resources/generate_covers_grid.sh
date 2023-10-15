#!/bin/sh

script_dir="$(dirname "$(readlink -e "$0")")"

# When omitting the shuffling, `montage "$script_dir/../plugins/*/cover.jpg" -tile …` should suffice,
# because the ImageMagick tools (as montage) provide built-in file-name globbing.
ls -1dQ "$script_dir"/../plugins/*/cover.jpg \
  | shuf \
  | tr '\n' ' ' \
  > /tmp/covers

eval montage "$(< /tmp/covers)" \
  -tile 10 \
  -geometry 100x100 \
  '"$script_dir"/../info/comics_covers.jpg'

rm -f /tmp/covers

