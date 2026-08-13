#!/usr/bin/env bash
# Check that every hyperlink in the site's .lean sources resolves.
#
# Usage: scripts/check_links.sh [path ...]
# Defaults to scanning Site/ if no paths are given.

set -uo pipefail

paths=("${@:-Site}")
user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"

urls=$(grep -rohE '\(https?://[^)[:space:]]+\)|href="https?://[^"]+"' "${paths[@]}" --include='*.lean' \
  | sed -E 's/^\(//; s/\)$//; s/^href="//; s/"$//' \
  | sort -u)

bad=0
while IFS= read -r url; do
  [ -z "$url" ] && continue
  code=$(curl -s -o /dev/null -w '%{http_code}' -L --max-time 10 -A "$user_agent" "$url")
  printf '%s\t%s\n' "$code" "$url"
  if [ "$code" -ge 400 ] 2>/dev/null || ! [[ "$code" =~ ^[0-9]+$ ]]; then
    bad=$((bad + 1))
  fi
done <<< "$urls"

if [ "$bad" -gt 0 ]; then
  echo
  echo "$bad link(s) returned an error or failed to connect. Some sites (e.g. ResearchGate, LinkedIn) block automated requests — check manually before assuming a flagged link is dead." >&2
  exit 1
fi
