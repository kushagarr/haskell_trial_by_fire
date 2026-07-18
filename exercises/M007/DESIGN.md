# Design Notes — M007

LEARNER_OWNED: yes

Answer in your own words without implementation code.

## Before code

### DQ-1 — Field meanings and identity
- Stage: `BEFORE CODE`
- Scope: every `Summary` field and `mempty`
- Maps to: API contract and Monoid identities; Gate 0
- Answer shape: table of field, semantic meaning, combination, and identity

What does each field mean, how does it combine, and which identity preserves that meaning?

Your answer:

### DQ-2 — Law domain
- Stage: `BEFORE CODE`
- Scope: arbitrary total `Summary` values
- Maps to: associativity and identity laws; Gate 0, PP
- Answer shape: distinguish law domain from derived-value invariant

Why must the instances be lawful even for manually constructed values that do not satisfy summarize-derived invariants?

Your answer:

### DQ-3 — Association strategy
- Stage: `BEFORE CODE`
- Scope: `summarize`
- Maps to: complexity/memory contract; Gate 0, PF, MM
- Answer shape: chosen association direction and predicted append/allocation behavior; no implementation recipe

Which combination association avoids a quadratic labels chain while preserving left-to-right order?

Your answer:

### DQ-4 — Law generators
- Stage: `BEFORE CODE`
- Scope: Semigroup/Monoid properties
- Maps to: law domain; Gate 0, PP, MU
- Answer shape: generator classes including arbitrary values and order-sensitive labels

What must generators include so tests exercise the full law domain rather than only values produced by smart constructors?

Your answer:

## Before assessment

### DQ-5 — Field-by-field associativity proof
- Stage: `BEFORE ASSESSMENT`
- Scope: `(<>)`
- Maps to: Semigroup associativity; OR
- Answer shape: proof sketch for each field under observational equality

Why is combination associative for counts, totals, and ordered labels?

Your answer:

### DQ-6 — Law evidence limits
- Stage: `BEFORE ASSESSMENT`
- Scope: property tests
- Maps to: law gates; OR
- Answer shape: distinguish falsification evidence from proof

Why can generated tests expose a law violation but not prove the universal law?

Your answer:

### DQ-7 — Representation change
- Stage: `BEFORE ASSESSMENT`
- Scope: cheap arbitrary combination
- Maps to: Gate 10 architecture change; OR, MR
- Answer shape: proposed representation property, invariant owner, and API tradeoff

What representation change would make arbitrary label combination cheaper, and which tradeoffs would it introduce?

Your answer:
