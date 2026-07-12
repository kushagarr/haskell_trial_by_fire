# Adversarial Review

REVIEW_STATUS: COMPLETE

Edge classes required before implementation:

- Every module: empty/minimal input, every constructor, boundary integers, duplicate values where meaningful, and no partial Prelude shortcuts.
- M001: repeated terminal transition, cancellation from each nonterminal state, zero/negative quantities rejected by constructor contract.
- M002/M003: empty, singleton, long finite, infinite input under bounded observation, highly unbalanced append patterns.
- M004: empty, singleton, only-left/only-right depth, repeated values under documented duplicate policy, deep skew.
- M005: absence at first/middle/final lookup and present empty/zero payloads.
- M006: empty path, nested path, multiple error constructors, values containing unusual Unicode, and stable rendering separated from structural equality.
- M007: empty identity, one element, regroupings, order-sensitive evidence, large combination chain.
- M008: constant, boundary, reversed, off-by-one, constructor-omission, and nontermination-prone mutants; generator starvation.
- B001: whitespace-only, unary/binary ambiguity, nested parentheses, left associativity, division by zero, unknown variable, integer boundaries, invalid token, missing delimiter, trailing garbage, deep nesting, and Unicode identifier policy (ASCII identifiers initially).

No cancellation/network/race cases are forced into this block because those domains are unsupported; their omission is deliberate rather than forgotten.
