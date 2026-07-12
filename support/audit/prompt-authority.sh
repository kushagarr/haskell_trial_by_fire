#!/usr/bin/env bash
set -u
status=0
while IFS= read -r file; do
  if ! rg -q 'AGENTS\.md' "$file"; then
    echo "FAIL prompt does not defer to AGENTS.md: $file"
    status=1
  fi
done < <(find prompts -type f -name '*.md' -print | sort)
if test "$status" -eq 0; then
  echo "PASS every prompt defers to AGENTS.md"
fi
exit "$status"
