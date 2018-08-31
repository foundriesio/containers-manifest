#!/bin/sh -e

here=$(readlink -f $(dirname $0))

venv=$(mktemp -d --suffix=pykwalify)
trap "rm -rf $venv" EXIT

echo "= Setting up a temporary venv for pykwalify"
python3 -m venv $venv
$venv/bin/pip3 install pykwalify

echo "= Validating release notes"
$venv/bin/pykwalify -d $here/release-notes.yml -s $here/release-notes-schema.yml
