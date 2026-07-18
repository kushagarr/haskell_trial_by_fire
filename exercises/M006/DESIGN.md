# Design Notes — M006

LEARNER_OWNED: yes

Answer in your own words without implementation code.

## Before code

### DQ-1 — Error taxonomy
- Stage: `BEFORE CODE`
- Scope: `parsePort`
- Maps to: FR-1..3, INV-1; Gate 0
- Answer shape: table of missing, syntax-invalid, range-invalid, and valid categories

Which inputs belong to each structural result category, and which original data must be preserved?

Your answer:

### DQ-2 — Overflow-safe decimal reasoning
- Stage: `BEFORE CODE`
- Scope: arbitrarily long digit strings
- Maps to: FR-2, FR-3, INV-2; Gate 0, PT, PF
- Answer shape: invariant/bound that avoids relying on bounded `Int`; no algorithm recipe

What reasoning lets validation reject an arbitrarily long decimal without overflowing a bounded intermediate?

Your answer:

### DQ-3 — Validation order
- Stage: `BEFORE CODE`
- Scope: `validateEndpoint`
- Maps to: FR-5; Gate 0, PT
- Answer shape: ordered stages and first observable failure

What is the public validation order, and why must later port work not occur after a missing or empty name?

Your answer:

### DQ-4 — Path ownership
- Stage: `BEFORE CODE`
- Scope: `prependPath` and error construction
- Maps to: FR-4, INV-1; Gate 0, PP
- Answer shape: invariant owner and constructor-by-constructor preservation claim

Which component owns path context, and what must `prependPath` preserve for every error constructor?

Your answer:

### DQ-5 — Structural properties
- Stage: `BEFORE CODE`
- Scope: parsing, range, and path behavior
- Maps to: FR-1..5, INV-1..2; Gate 0, PP
- Answer shape: named properties with independent oracles and edge classes

Which properties test structural errors and totality without flattening diagnostics to strings?

Your answer:

## Before assessment

### DQ-6 — Linear very-long-input behavior
- Stage: `BEFORE ASSESSMENT`
- Scope: decimal validation
- Maps to: complexity/memory contract; PF, MM, OR
- Answer shape: measured operation, demand, and expected growth

What evidence distinguishes linear decimal validation from overflow, repeated conversion, or quadratic text work?

Your answer:

### DQ-7 — Accumulating independent errors
- Stage: `BEFORE ASSESSMENT`
- Scope: future endpoint-validation change
- Maps to: Gate 10 architecture change; OR, MR
- Answer shape: which errors are independent, required type/ownership change, and unaffected contract

What would need to change to accumulate independent name and port errors rather than fail fast?

Your answer:
