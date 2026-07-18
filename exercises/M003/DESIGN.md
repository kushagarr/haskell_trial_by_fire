# Design Notes — M003

LEARNER_OWNED: yes

Answer in your own words without implementation code. Complete `BEFORE CODE` questions before implementation and `BEFORE ASSESSMENT` questions before the candidate commit.

## Before code

### DQ-1 — Strict left-fold meaning
- Stage: `BEFORE CODE`
- Scope: `foldLeftStrict`
- Maps to: FR-1, LAW-1; Gate 0
- Answer shape: parenthesized expression plus demanded accumulator state

How is a three-element input parenthesized, and what must be evaluated before the next step?

Your answer:

### DQ-2 — Right-fold meaning
- Stage: `BEFORE CODE`
- Scope: `foldRight`
- Maps to: FR-2, LAW-1; Gate 0
- Answer shape: parenthesized expression and one demand-sensitive observation

How is a three-element input parenthesized, and when may the result be observed without demanding the tail?

Your answer:

### DQ-3 — Accumulator invariant
- Stage: `BEFORE CODE`
- Scope: `foldLeftStrict`, `sumStrict`
- Maps to: FR-1, FR-3; Gate 0, MM
- Answer shape: invariant before/after one consumed element

What does the accumulator represent after consuming a prefix, and what evaluation property must hold?

Your answer:

### DQ-4 — Infinite-input classification
- Stage: `BEFORE CODE`
- Scope: all exported functions
- Maps to: FR-1..5; Gate 0, MM
- Answer shape: table of function, finite-input requirement, bounded productive observation, and stopping demand

Which functions require complete finite input, and which can produce a demanded prefix from infinite input?

Your answer:

### DQ-5 — Law evidence
- Stage: `BEFORE CODE`
- Scope: folds and `mapViaFoldRight`
- Maps to: LAW-1; Gate 0, PP
- Answer shape: named laws with domain assumptions and independent oracle

Which finite-input laws establish parenthesization and map behavior without reusing the implementation under test?

Your answer:

## Before assessment

### DQ-6 — Benchmark demand
- Stage: `BEFORE ASSESSMENT`
- Scope: `sumStrict`, mapped/taken results
- Maps to: FR-3..5 and complexity contract; PF, MM, OR
- Answer shape: operation, forced result, excluded construction, and expected growth

What exactly must each benchmark force for its measurement to support the claimed time/space behavior?

Your answer:

### DQ-7 — Strictness boundary
- Stage: `BEFORE ASSESSMENT`
- Scope: strict accumulator and result elements
- Maps to: FR-1, FR-3; MM, OR
- Answer shape: one prevented leak and one leak not prevented

What space leak does a strict accumulator prevent, and what deeper result or element thunk can still remain?

Your answer:

### DQ-8 — WHNF and productivity explanation
- Stage: `BEFORE ASSESSMENT`
- Scope: left/right folds and derived functions
- Maps to: FR-1..5; Gate 0, OR
- Answer shape: causal comparison, not code narration

How do WHNF, full evaluation, and combining-function demand explain the different productive behavior of the two folds?

Your answer:
