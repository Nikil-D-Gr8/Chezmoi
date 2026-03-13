#!/usr/bin/env bash
set -euo pipefail

WORKDIR="$HOME/.cache/everforest"

if [ -d "/usr/share/themes/Everforest-Dark" ] || [ -d "$HOME/.local/share/themes/Everforest-Dark" ]; then
    echo "Everforest already installed"
    exit 0
fi

rm -rf "$WORKDIR"
git clone https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme.git "$WORKDIR"

cd "$WORKDIR/themes"
./build.sh

cd release
./make-release.sh

tar -xf Everforest.tar.xz

mkdir -p "$HOME/.local/share/themes"
cp -r Everforest* "$HOME/.local/share/themes/"

echo "Everforest theme installed"
