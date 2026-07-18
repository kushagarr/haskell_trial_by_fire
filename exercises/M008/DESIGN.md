# Design Notes — M008

LEARNER_OWNED: yes

Do not write property implementations here. For DQ-1 through DQ-5, answer the same bounded fields separately so each property has an inspectable purpose.

## Before code

### DQ-1 — Reverse involution property
- Stage: `BEFORE CODE`
- Scope: `reverseInvolution`
- Maps to: reverse semantic contract and named reverse mutants; Gate 0, PP, MU
- Answer shape: claim, sound-candidate reason, mutant killed, oracle-independence risk, edge distribution, shrink target, termination bound

What evidence must this property provide under each answer field?

Your answer:

### DQ-2 — Reverse/append property
- Stage: `BEFORE CODE`
- Scope: `reverseAppendLaw`
- Maps to: reverse/append law and side-order mutants; Gate 0, PP, MU
- Answer shape: claim, sound-candidate reason, mutant killed, oracle-independence risk, edge distribution, shrink target, termination bound

What evidence must this property provide under each answer field?

Your answer:

### DQ-3 — Sort idempotence property
- Stage: `BEFORE CODE`
- Scope: `sortIdempotent`
- Maps to: sort idempotence and named sort mutants; Gate 0, PP, MU
- Answer shape: claim, sound-candidate reason, mutant killed, oracle-independence risk, edge distribution, shrink target, termination bound

What evidence must this property provide under each answer field?

Your answer:

### DQ-4 — Sort orderedness property
- Stage: `BEFORE CODE`
- Scope: `sortOrdered`
- Maps to: nondecreasing-order contract and named sort mutants; Gate 0, PP, MU
- Answer shape: claim, sound-candidate reason, mutant killed, oracle-independence risk, edge distribution, shrink target, termination bound

What evidence must this property provide under each answer field?

Your answer:

### DQ-5 — Sort permutation property
- Stage: `BEFORE CODE`
- Scope: `sortPermutation`
- Maps to: multiplicity-preservation contract and named sort mutants; Gate 0, PP, MU
- Answer shape: claim, sound-candidate reason, mutant killed, oracle-independence risk, edge distribution, shrink target, O(n²) bound

What evidence must this property provide under each answer field?

Your answer:

### DQ-6 — Generator and shrink design
- Stage: `BEFORE CODE`
- Scope: all properties
- Maps to: edge/generator requirements; Gate 0, PT, MU
- Answer shape: table of required edge class, frequency rationale, validity preservation, and shrink destination

How will generation and shrinking make the documented bug classes observable without hard-coded examples?

Your answer:

## Before assessment

### DQ-7 — Shared-oracle risk
- Stage: `BEFORE ASSESSMENT`
- Scope: every semantic property
- Maps to: oracle-independence requirement; OR
- Answer shape: one shared-bug risk and an independent alternative

How could a property reproduce the candidate's bug and falsely pass it?

Your answer:

### DQ-8 — Mutation evidence interpretation
- Stage: `BEFORE ASSESSMENT`
- Scope: mutation gate
- Maps to: mutation-central assessment; MU, OR
- Answer shape: explain what killed/surviving mutants establish and do not establish

Why is mutation score useful discrimination evidence but not a correctness proof or quality percentage?

Your answer:

### DQ-9 — Harness performance boundary
- Stage: `BEFORE ASSESSMENT`
- Scope: properties, generators, shrinkers, and candidates
- Maps to: harness-separated performance gate; PF, OR
- Answer shape: measured phases, forced results, configured size bound, and attribution rule

How will the assessment distinguish property cost from generator, shrinker, and candidate cost?

Your answer:
