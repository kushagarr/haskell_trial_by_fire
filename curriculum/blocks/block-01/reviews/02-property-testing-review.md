# Property-Testing Review

REVIEW_STATUS: COMPLETE

Findings before implementation:

- Avoid properties that call an equivalent library function as the sole oracle when a law or model is available.
- M001: transition result preserves documented state invariants and invalid operations never mutate state.
- M002: append associativity/identity, map composition, reverse involution, length preservation, productive take over repeat.
- M003: strict/lazy folds agree on finite totals; productivity properties use bounded observations; large tests must not let generators dominate measurement.
- M004: traversal cardinality and element multiset preservation, mirror involution, map composition, validity preserved by allowed operations.
- M005/M006: composition agrees with explicit case analysis; errors preserve constructor and path; normalization idempotence where defined.
- M007: associativity/identity for each instance and homomorphism for summaries; use constrained generators to exercise empty and order-sensitive cases.
- M008: meta-test properties against a sound candidate and realistic mutants; reject tautologies and properties that merely duplicate candidate output.
- B001: parse/render round trip modulo AST normalization, render/parse precedence cases, evaluation substitution/model properties, and trailing-garbage rejection.

Shrinking requirement: generators should be recursive with size control and shrink toward constructors/boundaries that preserve validity. Public suites demonstrate laws; exact high-risk distributions remain private categories.
