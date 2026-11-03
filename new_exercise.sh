#!/usr/bin/env bash
# Creates a new exercise folder inside a section and lists it in the section README.
# Usage: ./new_exercise.sh <section> [number | task-id] [title]
#   section - folder name (01_basics), its number (1, 01) or slug (basics)
#   number  - optional; the folder becomes exNN (defaults to the next free number)
#   task-id - optional Moodle task ID, e.g. T2/B/1; the folder becomes t2_b_1
#   title   - optional, defaults to "Untitled"
set -euo pipefail

cd "$(dirname "$0")"

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <section> [number | task-id] [title]" >&2
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

if [[ $# -ge 1 && "$1" =~ ^T[0-9]+(/[A-Z0-9]+)+$ ]]; then
  label="$1"; shift
  folder=$(printf '%s' "$label" | tr '[:upper:]/' '[:lower:]_')
elif [[ $# -ge 1 && "$1" =~ ^[0-9]+$ ]]; then
  n=$(( 10#$1 )); shift
else
  last=$(find "$section" -maxdepth 1 -type d -name 'ex[0-9]*' | sed 's|.*/ex||' | sort -n | tail -1)
  n=$(( 10#${last:-0} + 1 ))
fi

if [[ -z "${label:-}" ]]; then
  folder="ex$(printf '%02d' "$n")"
  label="Exercise $n"
  link="$n"
else
  link="$label"
fi

title="${*:-Untitled}"
dir="$section/$folder"
section_title=$(head -1 "$section/README.md" | sed 's/^# [0-9]*\. //')

if [[ -e "$dir" ]]; then
  echo "error: $dir already exists" >&2
  exit 1
fi

# escapes \, / and & so the text is safe as a sed replacement
esc() { printf '%s' "$1" | sed 's/[\\/&]/\\&/g'; }

mkdir "$dir"
sed -e "s/{{LABEL}}/$(esc "$label")/g" -e "s/{{TITLE}}/$(esc "$title")/g" -e "s/{{SECTION_TITLE}}/$(esc "$section_title")/g" \
  -e "s/{{DATE}}/$(date +%Y-%m-%d)/g" _template/README.md > "$dir/README.md"
printf -- '-- %s · %s — %s\n\n' "$section_title" "$label" "$title" > "$dir/solution.sql"
echo "| [$link]($folder/) | $title | ⏳ |" >> "$section/README.md"

echo "created $dir/README.md, $dir/solution.sql"
