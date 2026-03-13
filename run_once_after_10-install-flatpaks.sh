#!/usr/bin/env bash
set -euo pipefail

FILE="$HOME/.local/share/chezmoi/flatpak-apps.txt"

if ! command -v flatpak >/dev/null 2>&1; then
    echo "Flatpak not installed. Skipping."
    exit 0
fi

if [ ! -f "$FILE" ]; then
    echo "Flatpak app list not found: $FILE"
    exit 0
fi

echo "Installing Flatpak applications..."

while read -r app origin; do
    if [ -z "${app:-}" ]; then
        continue
    fi

    if flatpak info "$app" >/dev/null 2>&1; then
        echo "Already installed: $app"
    else
        echo "Installing $app from $origin"
        flatpak install -y "$origin" "$app"
    fi
done < "$FILE"

echo "Flatpak installation complete."
