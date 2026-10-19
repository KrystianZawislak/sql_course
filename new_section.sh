#!/usr/bin/env bash
# Creates a new section folder (NN_slug) from _template and lists it in README.md.
# Usage: ./new_section.sh "Title" [slug]
#   title - section title, e.g. "SQL Basics"
#   slug  - optional folder name suffix, defaults to the title in snake_case
set -euo pipefail

cd "$(dirname "$0")"

if [[ $# -lt 1 ]]; then
  echo "usage: $0 \"Title\" [slug]" >&2
  exit 1
fi

title="$1"
slug="${2:-$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]\{1,\}/_/g' -e 's/^_//' -e 's/_$//')}"

last=$(find . -maxdepth 1 -type d -name '[0-9][0-9]_*' | sed 's|^\./||' | cut -c1-2 | sort -n | tail -1)
n=$(printf '%02d' $(( 10#${last:-0} + 1 )))
dir="${n}_${slug}"

# escapes \, / and & so the text is safe as a sed replacement
esc() { printf '%s' "$1" | sed 's/[\\/&]/\\&/g'; }

mkdir "$dir"
sed -e "s/{{N}}/$n/g" -e "s/{{TITLE}}/$(esc "$title")/g" _template/SECTION.md > "$dir/README.md"
echo "| $n | [$title]($dir/) |" >> README.md

echo "created $dir/README.md"
