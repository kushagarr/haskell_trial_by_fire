# Test-Suite Integrity

Public suites teach the contract and evolve from supplied tests toward learner-authored properties. They may be strengthened in author mode before freeze; after freeze, meaningful coverage cannot be removed or bypassed.

Visible CI uses support/test-integrity/baseline.tsv to require key files and minimum named test/property markers. It also checks warning flags, package inclusion, protected-path declarations, and leakage indicators. This is a minimum guard, not proof of test quality.

Private CI should additionally keep approved hashes and semantic metadata, run private mutants, verify benchmark configuration, and reject excluded packages. Hash checks must account for modules that explicitly require learner-authored public tests: compare protected supplied regions or semantic requirements rather than forbidding legitimate additions.

Mutation review asks whether each mutant models a plausible fault, whether an appropriate public/private path kills it, and whether surviving mutants expose a requirement or test gap. Do not optimize for mutation percentage.

Line coverage is diagnostic only. A suite with high line coverage can still miss laws, invalid structures, scale, strictness, or changed requirements.
