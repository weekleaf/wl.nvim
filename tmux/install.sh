#!/usr/bin/env bash
# Install the tmux config in this folder to $HOME.
#
# Usage:
#   ./install.sh          symlink ~/.tmux.conf -> this repo's .tmux.conf (default)
#   ./install.sh --copy   copy the file instead of symlinking
#
# An existing ~/.tmux.conf is backed up to ~/.tmux.conf.bak.<timestamp>.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/.tmux.conf"
DEST="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"
MODE="link"

case "${1:-}" in
  --copy) MODE="copy" ;;
  --link|"") ;;
  *) echo "unknown option: $1" >&2; exit 1 ;;
esac

[ -f "$SRC" ] || { echo "missing $SRC" >&2; exit 1; }

# Already the symlink we would create -> nothing to do.
if [ "$MODE" = "link" ] && [ -L "$DEST" ] && [ "$(readlink "$DEST")" = "$SRC" ]; then
  echo "==> ~/.tmux.conf already links to $SRC"
elif [ -e "$DEST" ] || [ -L "$DEST" ]; then
  BACKUP="$DEST.bak.$(date +%Y%m%d%H%M%S)"
  mv "$DEST" "$BACKUP"
  echo "==> backed up existing ~/.tmux.conf to $BACKUP"
fi

if [ ! -e "$DEST" ]; then
  if [ "$MODE" = "link" ]; then
    ln -s "$SRC" "$DEST"
    echo "==> linked ~/.tmux.conf -> $SRC"
  else
    cp "$SRC" "$DEST"
    echo "==> copied .tmux.conf to ~/.tmux.conf"
  fi
fi

# The config's last line runs tpm, so make sure it is present.
if [ -d "$TPM_DIR" ]; then
  echo "==> tpm already installed at $TPM_DIR"
elif command -v git >/dev/null 2>&1; then
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM_DIR"
  echo "==> installed tpm to $TPM_DIR"
else
  echo "!! git not found, skipping tpm install" >&2
fi

# Install the plugins listed in the config (works without a running server).
if command -v tmux >/dev/null 2>&1 && [ -x "$TPM_DIR/bin/install_plugins" ]; then
  "$TPM_DIR/bin/install_plugins"
fi

# Reload the config in any running tmux server.
if command -v tmux >/dev/null 2>&1 && tmux info >/dev/null 2>&1; then
  tmux source-file "$DEST"
  echo "==> reloaded config in running tmux server"
fi

echo "==> done. In tmux, press prefix + I to (re)install plugins."
