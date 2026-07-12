#!/usr/bin/env bash
# Pangea Skills — install into Claude Code (~/.claude/skills).
#
# Local:
#   ./install.sh              # all
#   ./install.sh ui           # one
#   ./install.sh --list
#
# Remote:
#   curl -fsSL https://raw.githubusercontent.com/sisiphamus/pangea-skills/main/install.sh | bash
#   curl -fsSL https://raw.githubusercontent.com/sisiphamus/pangea-skills/main/install.sh | bash -s -- ui
#
set -euo pipefail

SKILLS_DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
DEFAULT_REPO="sisiphamus/pangea-skills"
REPO_SLUG="${SKILL_SHARE_REPO:-$DEFAULT_REPO}"
BRANCH="${SKILL_SHARE_BRANCH:-main}"

die() { echo "error: $*" >&2; exit 1; }

# Resolve pack root: script dir if skills/ exists, else clone from GitHub
resolve_root() {
  local here=""
  # When piped via curl, BASH_SOURCE is often not a real path — fall through to clone
  if [[ -n "${BASH_SOURCE[0]:-}" && "${BASH_SOURCE[0]}" != "bash" && -f "${BASH_SOURCE[0]}" ]]; then
    here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -d "$here/skills" ]]; then
      echo "$here"
      return
    fi
  fi
  if [[ -z "$REPO_SLUG" ]]; then
    die "not inside a skill-share checkout, and no repo slug set.
Either:  cd into the pack and run ./install.sh
Or:      set DEFAULT_REPO in install.sh after publishing
Or:      SKILL_SHARE_REPO=owner/repo bash install.sh"
  fi
  local tmp
  tmp="$(mktemp -d "${TMPDIR:-/tmp}/skill-share.XXXXXX")"
  # shellcheck disable=SC2064
  trap "rm -rf '$tmp'" EXIT
  echo "cloning github.com/${REPO_SLUG}@${BRANCH} …" >&2
  git clone --depth 1 --branch "$BRANCH" \
    "https://github.com/${REPO_SLUG}.git" "$tmp/repo" >/dev/null 2>&1 \
    || die "git clone failed for ${REPO_SLUG} (public repo? git installed?)"
  echo "$tmp/repo"
}

list_skills() {
  local root="$1"
  local d
  for d in "$root"/skills/*/; do
    [[ -f "${d}SKILL.md" ]] || continue
    local name purpose
    name="$(basename "$d")"
    purpose="$(
      awk '
        BEGIN { in_fm=0 }
        /^---[[:space:]]*$/ { if (++in_fm==1) next; if (in_fm==2) exit }
        in_fm==1 && $1=="purpose:" { sub(/^purpose:[[:space:]]*/, ""); print; exit }
        in_fm==1 && $1=="description:" { sub(/^description:[[:space:]]*/, ""); print; exit }
      ' "${d}SKILL.md"
    )"
    printf "  %-20s %s\n" "$name" "${purpose:-(no purpose)}"
  done
}

install_one() {
  local root="$1" name="$2"
  local src="$root/skills/$name"
  local dest="$SKILLS_DEST/$name"
  [[ -f "$src/SKILL.md" ]] || die "skill not found: $name (try --list)"
  mkdir -p "$SKILLS_DEST"
  rm -rf "$dest"
  mkdir -p "$dest"
  # Copy skill tree; skip junk
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --exclude '.git' --exclude '__pycache__' --exclude '*.pyc' "$src/" "$dest/"
  else
    cp -R "$src/." "$dest/"
  fi
  echo "installed  $name  →  $dest"
}

main() {
  local root
  root="$(resolve_root)"

  if [[ "${1:-}" == "--list" || "${1:-}" == "-l" ]]; then
    echo "Skills in pack ($root/skills):"
    list_skills "$root"
    echo
    echo "Install all:  $0"
    echo "Install one:  $0 <name>"
    exit 0
  fi

  if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    sed -n '2,16p' "$0" | sed 's/^# \?//'
    exit 0
  fi

  mkdir -p "$SKILLS_DEST"

  if [[ $# -eq 0 ]]; then
    local count=0
    local d
    for d in "$root"/skills/*/; do
      [[ -f "${d}SKILL.md" ]] || continue
      install_one "$root" "$(basename "$d")"
      count=$((count + 1))
    done
    [[ $count -gt 0 ]] || die "no skills found under $root/skills"
    echo
    echo "done: $count skill(s) → $SKILLS_DEST"
    echo "open a new Claude Code session and ask it to use the skill (e.g. ui)."
    exit 0
  fi

  local name
  for name in "$@"; do
    install_one "$root" "$name"
  done
  echo
  echo "done → $SKILLS_DEST"
  echo "open a new Claude Code session and ask it to use the skill."
}

main "$@"
