#!/usr/bin/env bash
set -u

status=0

require_pattern() {
  pattern=$1
  file=$2
  label=$3
  if ! rg -q "$pattern" "$file"; then
    echo "FAIL private-assessment wiring: $label"
    status=1
  fi
}

require_pattern 'ready for assessment' AGENTS.md 'semantic readiness trigger missing'
require_pattern 'continue to assessment automatically' AGENTS.md 'automatic readiness transition missing'
require_pattern 'support/bin/apprentice assess' prompts/learner/assess-module.md 'learner assessment prompt does not invoke bridge'
require_pattern 'TBF_PRIVATE_ASSESSOR' support/bin/apprentice 'private assessor configuration missing'
require_pattern 'PRIVATE-ASSESSMENT NOT-RUN' support/bin/apprentice 'fail-closed result missing'
require_pattern 'Never locate, open, search, or quote private assessment files' prompts/learner/assess-module.md 'private material boundary missing'
require_pattern 'MUTATION-GATE PASS' support/bin/apprentice 'mutation pass attestation check missing'
require_pattern 'explicit mutant attestations are incomplete' support/bin/apprentice 'incomplete mutation evidence does not fail closed'
require_pattern 'COMMIT CANDIDATE NOW' AGENTS.md 'candidate commit disposition missing'
require_pattern 'COMMIT EVIDENCE SEPARATELY' prompts/learner/next-step.md 'evidence commit disposition missing'
require_pattern 'what to do next or whether to commit' prompts/learner/start-session.md 'next-step semantic trigger missing'
require_pattern 'support/bin/apprentice design-status' prompts/learner/start-session.md 'session-start design status check missing'
require_pattern 'unanswered `BEFORE CODE` DQ' prompts/learner/next-step.md 'design-before-implementation precedence missing'
require_pattern 'ASSESSMENT NOT-RUN: required design questions are incomplete' support/bin/apprentice 'assessment design gate missing'

if test "$status" -eq 0; then
  echo "PASS learner/private assessment wiring"
fi

exit "$status"
