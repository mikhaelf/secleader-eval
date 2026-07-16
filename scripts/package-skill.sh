#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="$ROOT/secleader-eval"
DIST="$ROOT/dist"
STAGE="$DIST/secleader-eval"
CLAUDE_OUT="$DIST/secleader-eval.skill"
CURSOR_OUT="$DIST/secleader-eval-cursor.zip"

if [[ ! -f "$SOURCE/SKILL.md" ]]; then
  echo "error: expected $SOURCE/SKILL.md" >&2
  exit 1
fi

rm -rf "$DIST"
mkdir -p "$STAGE"
cp -R "$SOURCE/." "$STAGE/"

(
  cd "$DIST"
  zip -r secleader-eval.skill secleader-eval/
  zip -r secleader-eval-cursor.zip secleader-eval/
)

echo "Packaged Claude skill: $CLAUDE_OUT"
echo "Packaged Cursor skill: $CURSOR_OUT"
echo ""
unzip -l "$CLAUDE_OUT"
