#!/usr/bin/env bash
set -u

root=$(cd "$(dirname "$0")/../.." && pwd)
cd "$root" || exit 2
status=0

required="AGENTS.md README.md COURSE.md ROADMAP.md ASSESSMENT.md CURRICULUM_PRINCIPLES.md CONTRIBUTING.md PROJECT_HANDOVER.md"
for file in $required; do
  if test ! -f "$file"; then
    echo "FAIL required file missing: $file"
    status=1
  fi
done

./support/audit/prompt-authority.sh || status=1
./support/audit/no-solutions.sh || status=1
./support/audit/roadmap-depth.sh || status=1
./support/audit/test-integrity.sh || status=1
./support/audit/private-assessment-wiring.sh || status=1
./support/audit/module-generation.sh || status=1

frozen=$(rg -l '^MODULE_STATUS: FROZEN_FOR_ATTEMPT$' exercises boss-fights 2>/dev/null | wc -l | tr -d ' ')
if test "$frozen" != 1; then
  echo "FAIL expected exactly one frozen module, found $frozen"
  status=1
else
  echo "PASS exactly one frozen module"
fi

if rg -q 'The standards remain fixed; the route to meeting them adapts.' AGENTS.md; then
  echo "PASS governing principle"
else
  echo "FAIL governing principle missing"
  status=1
fi

exit "$status"
