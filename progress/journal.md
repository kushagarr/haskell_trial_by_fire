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

## 2026-07-13 — M002 `takeList` demand review

- Tutor hint (Level 5 counterexample): Public finite and non-positive-count checks passed, but evaluating the complete result of taking one element from a `Cons` whose tail is non-demandable forced that tail after producing the requested head. Review the helper's pattern-match priority so reaching the count boundary terminates without inspecting the remaining input.

## 2026-07-18 — M002 append associativity proof review

- Tutor hint (Level 4 structural observation): In the `Cons x xs'` case, matching outer `Cons x` constructors do not by themselves establish equality; the proof must explicitly assume associativity for the smaller first list `xs'`, use that assumption to equate the two recursive tails, and then conclude that wrapping both tails with the same constructor preserves equality.

## 2026-07-18 — M002 map composition law review

- Tutor hint (Level 4 structural observation): Turn the concrete two-application example into a general comparison between mapping in two stages and mapping once with the composed element transformation; the learner then stated the composition law independently of Prelude `map`.

## 2026-07-18 — M002 Gold certification

- Candidate: immutable commit `af5d69f`.
- Evidence: design DQ-1..12 complete; 16 public checks passed; PT-1..6 passed; MU-1..7 calibration attestations and `MUTATION-GATE PASS`; public benchmark and integrity checks completed; oral defense passed.
- Performance/memory observation: private scaling/allocation/residency categories support linear append/reverse/length behavior and bounded productivity; public benchmark timings were noisy supporting evidence only.
- Concept learned: laziness permits constructor-by-constructor production for map/repeat/conversion, while exact reversal requires finite input exhaustion; strict scalar accumulation avoids deferred-addition retention.
- Remaining doubt/revisit: independently stating recursive invariants and induction assumptions without strong scaffolding remains scheduled for M003/M004; the retrofitted design timing is a curriculum defect and not learner failure.
