# Learner Journal

Use dated entries. Record design choices, failed approaches, discovered counterexamples, performance findings, concepts learned, and remaining doubts. Do not paste private assessment source or exact hidden cases.

## 2026-07-12 — M001 Total Domain Transitions

- Decision and reason: Enumerated every phase/command pair explicitly so transition validity remains total and future constructors produce compiler-visible pressure rather than wildcard fallthrough.
- Failed approach and evidence: Reapplying every command to the initial phase was rejected because multi-command traces require the phase produced by each successful prior transition; the corresponding mutant was killed.
- Counterexample: A trace that moves through Submitted, Rejected, Draft, and back to Submitted distinguishes correct state threading from repeated use of the initial phase.
- Performance/memory observation: Public timings were noisy, so qualification used structural O(k) reasoning plus private long-trace resource guards and finite-prefix non-demand evidence.
- Concept learned: The failure index is the count of successful transitions before the first invalid command; advancing it only after success establishes the least-index invariant.
- Remaining doubt: Transfer of the same termination, strictness, and productivity reasoning to a custom recursive list remains to be demonstrated in M002.

## Entry template

Date/module:

- Decision and reason:
- Failed approach and evidence:
- Counterexample:
- Performance/memory observation:
- Concept learned:
- Remaining doubt:
