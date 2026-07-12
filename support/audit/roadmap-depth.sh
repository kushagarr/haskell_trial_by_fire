#!/usr/bin/env bash
set -u
status=0

unexpected=$(find exercises -mindepth 1 -maxdepth 1 -type d ! -name 'M00[1-8]' -print 2>/dev/null)
if test -n "$unexpected"; then
  echo "FAIL detailed exercises exist beyond block 01: $unexpected"
  status=1
fi

unexpected_boss=$(find boss-fights -mindepth 1 -maxdepth 1 -type d ! -name 'B001-expression-language' -print 2>/dev/null)
if test -n "$unexpected_boss"; then
  echo "FAIL detailed boss exists beyond B001: $unexpected_boss"
  status=1
fi

if test "$status" -eq 0; then
  echo "PASS later curriculum remains roadmap-level"
fi
exit "$status"
