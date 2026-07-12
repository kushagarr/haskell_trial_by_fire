# Contributing Curriculum and Infrastructure

Read AGENTS.md and PROJECT_HANDOVER.md before changing course material. Preserve learner ownership and the public/private boundary.

## Change classes

- Future curriculum: enter CURRICULUM_AUTHOR explicitly, review progress evidence, propose, run six reviews, revise, implement, audit, then mark AUDITED_READY.
- Active frozen module: follow docs/governance/FROZEN_CHANGE_CONTROL.md. Learner difficulty is not a defect.
- Learner source: only the learner edits it during an attempt. Agents in tutor mode review read-only.
- Governance: explain why the change preserves or strengthens the handover; run the governance audit and report findings before repairing audit failures.
- Public tests: never remove a meaningful case or reduce integrity baselines merely to pass. Additions must map to documented requirements.

## Quality checks

~~~text
cabal build all
./support/bin/apprentice governance-audit
./support/bin/apprentice integrity
hlint .
fourmolu --mode check exercises boss-fights
~~~

Unavailable tools must be reported, not silently treated as passing. Public tests on untouched stubs are expected to fail; infrastructure/build errors are not.

## Commit hygiene

Keep governance, curriculum intent, learner scaffolding, and assessment changes reviewable. Update module CHANGELOG.md for any frozen correction. Do not commit private test material, solutions, build products, profiles containing sensitive data, or generated answers.
