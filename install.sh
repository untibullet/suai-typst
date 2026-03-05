#!/usr/bin/env bash
set -euo pipefail

NAME="suai-typst"
VERSION="0.1.0"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$OSTYPE" in
  darwin*)       BASE="$HOME/Library/Application Support/typst/packages/local" ;;
  msys*|cygwin*) BASE="$APPDATA/typst/packages/local" ;;
  *)             BASE="$HOME/.local/share/typst/packages/local" ;;
esac

DEST="$BASE/$NAME/$VERSION"
mkdir -p "$(dirname "$DEST")"
ln -sfn "$SRC" "$DEST"
echo "Установлен $NAME $VERSION → $DEST"
