#!/usr/bin/env bash
set -u

root=$(cd "$(dirname "$0")/../.." && pwd)
cd "$root" || exit 2
status=0

fail() {
  echo "FAIL generated-module standard: $1"
  status=1
}

for required in \
  docs/governance/DESIGN_QUESTIONS.md \
  docs/governance/MODULE_GENERATION_STANDARD.md \
  templates/DESIGN_TEMPLATE.md
do
  test -f "$required" || fail "missing $required"
done

while IFS= read -r metadata; do
  module=$(sed -n 's/^module:[[:space:]]*//p' "$metadata" | sed -n '1p')
  version=$(sed -n 's/^version:[[:space:]]*//p' "$metadata" | sed -n '1p')
  module_status=$(sed -n 's/^status:[[:space:]]*//p' "$metadata" | sed -n '1p')
  test "$module_status" = RETIRED && continue

  package=$(dirname "$metadata")
  readme="$package/README.md"
  design="$package/DESIGN.md"
  test -f "$readme" || { fail "$module missing README.md"; continue; }
  test -f "$design" || { fail "$module missing DESIGN.md"; continue; }

  readme_version=$(sed -n 's/^MODULE_VERSION:[[:space:]]*//p' "$readme" | sed -n '1p')
  test "$version" = "$readme_version" || fail "$module README/assessment version mismatch"

  question_count=$(rg -c '^### DQ-[0-9]+ — ' "$design" 2>/dev/null || true)
  question_count=${question_count:-0}
  unique_count=$(rg -o '^### DQ-[0-9]+' "$design" 2>/dev/null | sort -u | wc -l | tr -d ' ')
  stage_count=$(rg -c '^- Stage: `(BEFORE CODE|BEFORE ASSESSMENT)`$' "$design" 2>/dev/null || true)
  scope_count=$(rg -c '^- Scope: ' "$design" 2>/dev/null || true)
  mapping_count=$(rg -c '^- Maps to: ' "$design" 2>/dev/null || true)
  shape_count=$(rg -c '^- Answer shape: ' "$design" 2>/dev/null || true)
  answer_count=$(rg -c '^Your answer:$' "$design" 2>/dev/null || true)

  stage_count=${stage_count:-0}
  scope_count=${scope_count:-0}
  mapping_count=${mapping_count:-0}
  shape_count=${shape_count:-0}
  answer_count=${answer_count:-0}

  if test "$question_count" -eq 0 || \
     test "$unique_count" -ne "$question_count" || \
     test "$stage_count" -ne "$question_count" || \
     test "$scope_count" -ne "$question_count" || \
     test "$mapping_count" -ne "$question_count" || \
     test "$shape_count" -ne "$question_count" || \
     test "$answer_count" -ne "$question_count"; then
    fail "$module DESIGN.md lacks complete unique DQ anatomy"
    continue
  fi

  if ! rg -q '^- Stage: `BEFORE CODE`$' "$design" || ! rg -q '^- Stage: `BEFORE ASSESSMENT`$' "$design"; then
    fail "$module DESIGN.md lacks both required stages"
    continue
  fi

  ./support/bin/apprentice design-status "$module" >/dev/null 2>&1
  parser_status=$?
  if test "$parser_status" -eq 2; then
    fail "$module DESIGN.md is not readable by apprentice design-status"
    continue
  fi

  echo "PASS $module structured design questions ($question_count)"
done < <(find exercises boss-fights -type f -name assessment.yaml -print | sort)

if ! rg -q 'MODULE_GENERATION_STANDARD\.md' prompts/curriculum/implement-approved-block.md || \
   ! rg -q 'DESIGN_QUESTIONS\.md' prompts/curriculum/audit-module-tests.md || \
   ! rg -q ' DQ ' templates/PRE_ATTEMPT_AUDIT_TEMPLATE.md; then
  fail 'generation prompts/templates do not enforce DQ traceability'
fi

if test "$status" -eq 0; then
  echo "PASS generated-module artifact standard"
fi

exit "$status"
