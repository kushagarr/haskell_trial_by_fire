# Assessment System

Assessment is a matrix of evidence, not a score or a test command. Each module selects appropriate gates in assessment.yaml and maps every meaningful requirement in its pre-attempt audit.

## Gates

0. Design: invariants, type choices, partiality, hot operations, strictness, and test strategy.
1. Compilation: module warning policy including Wall, compat, incomplete patterns/records/uni-patterns, missing signatures/exports, redundant constraints, and Werror where declared.
2. Public examples: visible contract cases.
3. Public properties: laws, round trips, preservation, or model agreement.
4. Adversarial/private categories: documented edges and malformed/large/deep inputs.
5. Totality and forbidden APIs: source scan plus review, scoped per module.
6. Mutation: realistic faults, with quality judged by relevance rather than score vanity. This gate calibrates the assessment paths against deliberately faulty reference candidates; it does not mutate each learner submission. Certification requires an explicit trusted, contract/toolchain-matched attestation for every declared mutant rather than inference from PT results.
7. Complexity: scaling ratios, operation counters, and deliberately weak baselines.
8. Memory/strictness: allocation growth, residency, stack behavior, retention, and productivity.
9. Streaming: chunk boundaries, bounded memory, cancellation, partial final chunks, and cleanup where applicable.
10. Architecture/change: invariant ownership and localization under a documented new requirement.
11. Explanation/oral defense: termination, laws, complexity, space, evaluation, types, failure, and tradeoffs.
12. Refactor/revisit: later abstraction must improve a stated quality, not merely shorten code.
13. Hidden integration: fair, documented-contract transfer without a recipe.

## Performance fairness

No qualification rests on one exact duration. Prefer n/2n/4n growth, operation instrumentation, allocations, maximum residency, stack depth, and comparison to a deliberately poor baseline. Wall-clock limits are broad hang guards. Record toolchain, RTS flags, input construction, measured operation, warmup, noise tolerance, and interpretation.

## Public/private boundary

Public tests, properties, benchmark drivers, plans, and assessment metadata live here. Concrete hidden tests, reference solutions, answer keys, approved hashes, and private mutants live in a separately permissioned repository or CI environment. Hidden feedback names the documented category, such as deeply skewed input or trailing garbage, without revealing source or the exact case.

## Reports

Reports use templates/ASSESSMENT_REPORT_TEMPLATE.md. They record evidence per gate, strengths, weaknesses, unresolved risks, hint history, certification, and required work. Passing examples alone cannot certify a module.
