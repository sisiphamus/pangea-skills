#!/usr/bin/env bash
# Copy a skill folder into this pack (portable snapshot; does not rewrite paths).
# Usage: scripts/add-skill.sh /path/to/skill-dir [name]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${1:?usage: add-skill.sh /path/to/skill-dir [name]}"
NAME="${2:-$(basename "$SRC")}"
DEST="$ROOT/skills/$NAME"

if [[ ! -f "$SRC/SKILL.md" && -f "$SRC" ]]; then
  # Single SKILL.md path
  if [[ "$(basename "$SRC")" == "SKILL.md" ]]; then
    SRC="$(dirname "$SRC")"
    NAME="${2:-$(basename "$SRC")}"
    DEST="$ROOT/skills/$NAME"
  fi
fi

if [[ ! -f "$SRC/SKILL.md" ]]; then
  echo "error: $SRC/SKILL.md not found" >&2
  exit 1
fi

mkdir -p "$DEST"
rsync -a --delete \
  --exclude '.git' \
  --exclude '__pycache__' \
  --exclude '*.pyc' \
  "$SRC/" "$DEST/"
echo "added skills/$NAME ($(wc -l < "$DEST/SKILL.md") lines in SKILL.md)"
echo "tip: rewrite vault paths (us/skills/...) in SKILL.md before sharing"
