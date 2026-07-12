#!/usr/bin/env bash
set -u
status=0
baseline=support/test-integrity/baseline.tsv

if test ! -f "$baseline"; then
  echo "FAIL missing $baseline"
  exit 1
fi

while IFS=$'\t' read -r file units properties; do
  case "$file" in ''|'#'*) continue ;; esac
  if test ! -f "$file"; then
    echo "FAIL missing public suite: $file"
    status=1
    continue
  fi
  actual_units=$(rg -c 'testCase|@\?=' "$file" 2>/dev/null || true)
  actual_props=$(rg -c 'testProperty|QC\.testProperty' "$file" 2>/dev/null || true)
  test "${actual_units:-0}" -ge "$units" || { echo "FAIL unit marker baseline: $file"; status=1; }
  test "${actual_props:-0}" -ge "$properties" || { echo "FAIL property marker baseline: $file"; status=1; }
done < "$baseline"

if ! rg -q -- '-Werror' cabal.project; then
  echo "FAIL Werror missing from cabal.project"
  status=1
fi

if test "$status" -eq 0; then
  echo "PASS visible public-suite minimums and warning policy"
fi
exit "$status"
