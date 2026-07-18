# Generated-Module Artifact Standard

This standard applies whenever Codex or a curriculum author generates or refreshes a module, boss fight, public assessment, or private-CI package. It complements AGENTS.md and does not relax the rolling-authoring lifecycle.

## Traceability chain

Every meaningful claim follows one inspectable chain:

~~~text
README requirement/invariant ID
  -> DESIGN question ID where reasoning is required
  -> public/private/performance/mutation/oral evidence ID
  -> calibrated runner or named manual review
  -> assessment report bound to a candidate commit
  -> progress/revisit record
~~~

No generated artifact may create an undocumented requirement, orphan a gating question, or claim evidence without an executable or explicitly named review path.

## Public artifact contract

- README: exact API, stable requirement/invariant IDs, domain/equality assumptions, complexity/demand, forbidden shortcuts, gates, reflection, and revisit.
- DESIGN.md: structured according to `DESIGN_QUESTIONS.md` and learner-owned.
- assessment.yaml: matching module/version/status, learner-owned paths, every required gate, and `external_only` private material.
- PUBLIC_TEST_PLAN.md: test/property IDs mapped to requirements, including demand and limitation.
- PRIVATE_TEST_PLAN.md: category IDs mapped only to public requirements, category-level feedback, and no exact cases.
- MUTATION_PLAN.md: realistic mutant IDs, requirement mapping, expected public/private killer, and adequacy rationale.
- PERFORMANCE_PLAN.md: measured operation, input construction, forced result, n/2n/4n series, allocation/residency/stack/productivity evidence, broad guards, and interpretation.
- CHANGELOG.md and REVISIT_PLAN.md: lifecycle history and independent transfer schedule.

## Private-CI contract

The private system remains outside the learner checkout and treats it as untrusted input. For each provisioned version it records a manifest with module/version/toolchain, declared PT and MU IDs, reference calibration, mutation-evidence reference, and approved public integrity where applicable. Runners emit category-only PT results. Mutation calibration proves every declared realistic mutant is killed by its intended category and the trusted dispatcher emits explicit `MU-N KILLED PT-N` attestations plus `MUTATION-GATE PASS` only after module/version/toolchain/set/category validation. Missing, stale, mismatched, or partial evidence fails closed as NOT RUN.

Resource qualification names the measured operation and demand, separates input construction, uses scaling/allocation/residency/stack evidence as appropriate, and treats timeouts only as broad hang guards. Private CI never returns source, exact fixtures, seeds that reconstruct cases, reference algorithms, or source-containing artifacts.

## Generation and freeze procedure

1. Review current learner evidence and lifecycle scope before detailed generation.
2. Generate from repository templates; do not clone a prior module mechanically without revalidating scope and mappings.
3. Run the six independent reviews, including design-question clarity/leakage and private-CI fairness/calibration.
4. Complete requirement-to-DQ-to-evidence traceability and executable reference/mutant calibration.
5. Run governance and generation-conformance audits, and verify the generated DQ anatomy is readable by `./support/bin/apprentice design-status MODULE_ID`.
6. Mark `AUDITED_READY` only with no unexplained gap; refresh version, toolchain, integrity, and private attestations immediately before freeze.

Generated file presence is never evidence of conformance. Audit content and mappings.
