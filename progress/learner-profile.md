# Learner Technical Profile

Last updated: 2026-07-18 after M002 Gold certification at `af5d69f`

## Demonstrated capabilities

- exhaustive modeling of a closed domain without wildcard fallthrough;
- total transition functions with structural error preservation;
- left-to-right recursive state threading and least-failure indexing;
- linear consumed-prefix reasoning, strict counter state, and early-failure productivity;
- explanation of termination, demand, change localization, and realistic mutation faults.
- structural recursion over a custom collection with order and shape preservation;
- productive bounded observation of infinite structures and bottom-sensitive demand boundaries;
- linear accumulator reversal, strict finite measurement, and operation-specific complexity reasoning;
- use of round-trip, identity, composition, involution, and bounded-prefix laws with tutor-supported formal articulation.

## Capabilities awaiting evidence

- independent transfer of recursive reasoning to folds and branching structures (M003–M004);
- explicit failure modeling in multi-stage lookup and validation (M005–M006);
- law-driven composition (M007);
- discriminating learner-authored property design (M008).

## Evidence table

| Capability claim | Evidence | Confidence | Transfer evidence | Next check |
|---|---|---|---|---|
| Exhaustive domain modeling and total transitions | M001 Gold, commit `96c3bf8`; PT-1/PT-5; oral defense | High in direct context | Not yet independent | M003 and B001 |
| First-failure state threading | Public properties; PT-2/PT-4; MU-4..6 killed | High in M001 | Not yet independent | M003 trace processing |
| Linear-work and demand reasoning | PT-3/PT-4; benchmark; oral defense | Medium-high | Single recursive-list context only | M002 reverse/take productivity, then M003 strict folds |
| Change localization under an added constructor/command | Design and oral defense | Medium | Discussed, not implemented in a second domain | B001 AST evolution |
| Structural recursion over custom lists | M002 Gold, commit `af5d69f`; public suite; PT-1 | High in direct list context | First transfer beyond M001 transition traces | M003 folds and M004 trees |
| Productivity and non-demand reasoning | M002 PT-4/PT-5; zero-take public check; oral defense | Medium-high | Demonstrated for custom and Prelude-list boundaries | Streaming text boss |
| Linear work, allocation, and strictness | M002 PT-2/PT-3; benchmark; strict accumulator review; oral defense | Medium-high | Demonstrated in append/reverse/length | M003 strict folds |
| Algebraic law and induction articulation | M002 design/public properties; oral defense | Medium with scaffolding | Map composition derived; append proof needed Level 4 hint | M003/M004 with reduced scaffolding |
