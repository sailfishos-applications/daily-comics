#!/bin/sh

script_dir="$(dirname "$(readlink -e "$0")")"
prefix_list="La |Le |Les |L'|L\’|El |Los |Las |Lo |Il |I |Gli |Un |Una |Uno |Une |The |De |Het |Die |Der |Das |Ein "
# Retrieve the real names of the plugins,
# order them ignoring some prefixes and
# prepend a dash ("-") to each line:
grep -Fhm 1 '"name":' "$script_dir"/../plugins/*/info.json \
  | sed -E -e 's/^.*"name":\s*"([^"]*)".*$/\1/' -e "s/^($prefix_list)(.*)\$/\\2,\\1/" \
  | sort \
  | sed -E -e "s/^(.*),($prefix_list)\$/\\2\\1/" -e 's/^/- /' \
  > "$script_dir"/../info/comics_list.md

