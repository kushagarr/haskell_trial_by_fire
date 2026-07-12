# Frozen Module Change Control

## Status model

- DRAFT 0.x: incomplete and not attemptable.
- REVIEWED 0.x: six block reviews and revisions recorded.
- AUDITED_READY 0.x: complete artifacts and coverage audit, awaiting activation refresh.
- FROZEN_FOR_ATTEMPT 1.x: active immutable learner contract.
- RETIRED: preserved record no longer assigned.

Only one module is normally FROZEN_FOR_ATTEMPT.

## Permitted defect classes

Contradictory specification, incorrect expected result, test contradicting the contract, nondeterministic benchmark, platform incompatibility, impossible API, material ambiguity, or missing assessment coverage for an already documented invariant.

Learner failure, an unexpected learner design, a difficult edge, slow progress, or a desire for easier grading is not evidence of a defect.

## Repair procedure

1. Stop mutation of the frozen files and collect reproducible evidence.
2. Classify the objective defect and identify affected contract clauses/evidence.
3. Use prompts/maintenance/repair-defective-module.md in explicit author mode.
4. Make the smallest correction; never opportunistically redesign adjacent material.
5. Add a CHANGELOG entry with date, old/new behavior, evidence, class, impact, and migration or retake decision.
6. Bump patch version for clarification/test repair that preserves intent; minor version for a necessary contract correction. A major reset requires withdrawing and re-auditing the attempt.
7. Rerun the complete pre-attempt audit and relevant public/infrastructure checks.
8. Tell the learner what contract area changed without disclosing private cases.

Never silently edit a frozen module. Preserve prior assessment evidence and mark whether it remains comparable.
