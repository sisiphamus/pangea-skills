#!/usr/bin/env bash
# Rebuild catalog.md from skills/*/SKILL.md frontmatter.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/catalog.md"
{
  echo "# Pangea Skills — catalog"
  echo
  echo "Auto-generated. Run \`scripts/build-catalog.sh\` after adding skills."
  echo
  echo "| Skill | Purpose |"
  echo "|-------|---------|"
  for d in "$ROOT"/skills/*/; do
    [[ -f "${d}SKILL.md" ]] || continue
    name="$(basename "$d")"
    purpose="$(
      awk '
        BEGIN { in_fm=0 }
        /^---[[:space:]]*$/ { if (++in_fm==1) next; if (in_fm==2) exit }
        in_fm==1 && $1=="purpose:" { sub(/^purpose:[[:space:]]*/, ""); gsub(/\|/, "\\|"); print; exit }
        in_fm==1 && $1=="description:" { sub(/^description:[[:space:]]*/, ""); gsub(/\|/, "\\|"); print; exit }
      ' "${d}SKILL.md"
    )"
    echo "| \`$name\` | ${purpose:-(no purpose)} |"
  done
  echo
  echo "## Install"
  echo
  echo '```bash'
  echo './install.sh          # all'
  echo './install.sh ui       # one'
  echo '```'
} >"$OUT"
echo "wrote $OUT"
