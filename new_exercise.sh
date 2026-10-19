#!/usr/bin/env bash
# Creates a new exercise folder (exNN) inside a section and lists it in the section README.
# Usage: ./new_exercise.sh <section> [number] [title]
#   section - folder name (01_basics), its number (1, 01) or slug (basics)
#   number  - optional, defaults to the next free number in the section
#   title   - optional, defaults to "Untitled"
set -euo pipefail

cd "$(dirname "$0")"

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <section> [number] [title]" >&2
  exit 1
fi

query="$1"; shift
section=""
for d in [0-9][0-9]_*/; do
  d="${d%/}"
  if [[ "$d" == "$query" || "${d#*_}" == "$query" ]] ||
     [[ "$query" =~ ^[0-9]+$ && $(( 10#${d%%_*} )) -eq $(( 10#$query )) ]]; then
    section="$d"; break
  fi
done

if [[ -z "$section" ]]; then
  echo "error: section '$query' not found (create it with ./new_section.sh)" >&2
  exit 1
fi

if [[ $# -ge 1 && "$1" =~ ^[0-9]+$ ]]; then
  n=$(( 10#$1 )); shift
else
  last=$(find "$section" -maxdepth 1 -type d -name 'ex[0-9]*' | sed 's|.*/ex||' | sort -n | tail -1)
  n=$(( 10#${last:-0} + 1 ))
fi

title="${*:-Untitled}"
num=$(printf '%02d' "$n")
dir="$section/ex$num"
section_title=$(head -1 "$section/README.md" | sed 's/^# [0-9]*\. //')

if [[ -e "$dir" ]]; then
  echo "error: $dir already exists" >&2
  exit 1
fi

mkdir "$dir"
sed -e "s/{{N}}/$n/g" -e "s/{{TITLE}}/$title/g" -e "s/{{SECTION_TITLE}}/$section_title/g" \
  -e "s/{{DATE}}/$(date +%Y-%m-%d)/g" _template/README.md > "$dir/README.md"
printf -- '-- %s · Exercise %s — %s\n\n' "$section_title" "$n" "$title" > "$dir/solution.sql"
echo "| [$n](ex$num/) | $title | ⏳ |" >> "$section/README.md"

echo "created $dir/README.md, $dir/solution.sql"
