#!/usr/bin/env bash

set -e

WORKDIR="$HOME/.cache/everforest"

rm -rf "$WORKDIR"
git clone https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme.git "$WORKDIR"

cd "$WORKDIR/themes"
./build.sh
cd release
./make-release.sh

tar -xf Everforest.tar.xz
sudo cp -r Everforest* /usr/share/themes/
