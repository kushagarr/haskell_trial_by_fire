# Design Notes — M005

LEARNER_OWNED: yes

Answer in your own words without implementation code.

## Before code

### DQ-1 — Absence boundaries
- Stage: `BEFORE CODE`
- Scope: `findUser`, `findTeam`, `preferredLead`
- Maps to: FR-1..3, INV-1; Gate 0
- Answer shape: ordered list of each boundary and its result

At which exact stages can ordinary absence occur, and how is each represented without a sentinel?

Your answer:

### DQ-2 — Duplicate identifiers
- Stage: `BEFORE CODE`
- Scope: `findUser`, `findTeam`
- Maps to: FR-1, INV-2; Gate 0, PP
- Answer shape: first-match invariant and one duplicate counterexample

What must happen when identifiers repeat, and which observation distinguishes first-match from last-match behavior?

Your answer:

### DQ-3 — Empty versus absent lead
- Stage: `BEFORE CODE`
- Scope: final lead lookup
- Maps to: FR-3; Gate 0, UT, PT
- Answer shape: compare `Nothing` with `Just ""`

Why must a present empty string remain distinct from an absent lead?

Your answer:

### DQ-4 — Traversal budget
- Stage: `BEFORE CODE`
- Scope: `preferredLead`
- Maps to: complexity contract, INV-3; Gate 0, PF
- Answer shape: maximum traversal count for each collection and short-circuit condition

How many user/team traversals are permitted, and which missing dependency must prevent later demand?

Your answer:

### DQ-5 — Independent property
- Stage: `BEFORE CODE`
- Scope: lookup composition
- Maps to: FR-1..3; Gate 0, PP
- Answer shape: semantic property with an oracle not implemented by `preferredLead`

What property can test composed lookup behavior without duplicating the implementation under test?

Your answer:

## Before assessment

### DQ-6 — Evidence of short circuit
- Stage: `BEFORE ASSESSMENT`
- Scope: missing-user path
- Maps to: INV-3; PT, PF, OR
- Answer shape: demand-based explanation

How can laziness provide evidence that teams are not required after a missing user?

Your answer:

### DQ-7 — When absence is too weak
- Stage: `BEFORE ASSESSMENT`
- Scope: future diagnostics and data-structure choice
- Maps to: reflection/change judgment; OR
- Answer shape: one diagnostic requirement and one scale requirement

When would `Maybe` be too weak, and when would a map become justified despite the current list contract?

Your answer:
