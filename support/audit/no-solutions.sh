#!/usr/bin/env bash
set -u
status=0

if find . -path './.git' -prune -o -type d \( -iname '*reference*solution*' -o -iname '*answer*key*' -o -iname 'hidden-tests' \) -print | rg -q .; then
  echo "FAIL solution or hidden-test directory present"
  status=1
fi


if test "$status" -eq 0; then
  echo "PASS no visible solution/hidden-test paths"
fi
exit "$status"
