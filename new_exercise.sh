#!/usr/bin/env bash
# Creates a new exercise folder (exN) from _template.
# Usage: ./new_exercise.sh [number] [title]
#   number - optional, defaults to the next free number
#   title  - optional, defaults to "Untitled"
set -euo pipefail

cd "$(dirname "$0")"

if [[ $# -ge 1 && "$1" =~ ^[0-9]+$ ]]; then
  n="$1"; shift
else
  last=$(find . -maxdepth 1 -type d -name 'ex[0-9]*' | sed 's|^\./ex||' | sort -n | tail -1)
  n=$(( ${last:-0} + 1 ))
fi

title="${*:-Untitled}"
dir="ex$n"

if [[ -e "$dir" ]]; then
  echo "error: $dir already exists" >&2
  exit 1
fi

mkdir "$dir"
sed -e "s/{{N}}/$n/g" -e "s/{{TITLE}}/$title/g" -e "s/{{DATE}}/$(date +%Y-%m-%d)/g" \
  _template/README.md > "$dir/README.md"

echo "created $dir/README.md"
