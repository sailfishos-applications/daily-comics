#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -e "$0")")
PREFIX_LIST="The |La |Le |Les |L['’]|El |Los |Las |Lo |Il |I |Gli |Una |Uno |Une |De |Het |Die |Der |Das "
# Retrieve the real names of the plugins,
# order them ignoring some prefixes and
# prepend a dash ("-") to each line:
grep -Fhm 1 '"name":' "${SCRIPT_DIR}"/../plugins/*/info.json \
  | sed -E -e 's/.*"name":\s*"([^"]*)".*/\1/' -e "s/^($PREFIX_LIST)(.*)/\\2,\\1/" \
  | sort \
  | sed -E -e "s/^(.*),($PREFIX_LIST)\$/\\2\\1/" -e 's/^/- /' \
  > "${SCRIPT_DIR}"/../info/comics_list.md

