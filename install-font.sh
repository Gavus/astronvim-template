#!/bin/bash -e

VERSION="v3.3.0"
ZIP="SourceCodePro.zip"
FONT="SauceCodeProNerdFontMono-Regular.ttf"
DESTDIR="$HOME/.local/share/fonts"

if [[ ! -f "$ZIP" ]]; then
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/$ZIP"
fi

mkdir -p "$DESTDIR"
unzip -j "$ZIP" "$FONT" -o -d "$DESTDIR"

echo "Done."