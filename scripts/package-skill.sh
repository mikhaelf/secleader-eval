#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
SKILL_DIR="$DIST/secleader-eval"
OUTPUT="$DIST/secleader-eval.skill"

rm -rf "$DIST"
mkdir -p "$SKILL_DIR"
cp "$ROOT/SKILL.md" "$SKILL_DIR/"

(
  cd "$DIST"
  zip -r secleader-eval.skill secleader-eval/
)

echo "Packaged: $OUTPUT"
unzip -l "$OUTPUT"
