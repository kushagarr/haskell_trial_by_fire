# Mutation Plan — B001

| Mutant | Realistic defect | Expected evidence |
|---|---|---|
| omit Unary/Let evaluator branch | incomplete AST coverage | compilation/UT-E/private |
| parse additive right-associatively | wrong tree shape | UT-P2/round trip |
| give + tighter precedence than * | precedence bug | UT-P2/PT-P2 |
| accept a valid prefix and ignore suffix | consumption bug | UT-P4/PT-P3 |
| allow keyword as identifier | lexical ambiguity | PT-L1 |
| resolve last environment binding | shadowing bug | UT-E2/PT-E2 |
| evaluate let body before binding value | scope/order bug | UT-E2/PT-E2 |
| convert division by zero to zero | failure erasure | UT-E1 |
| printer omits right-child parentheses for subtraction/division | association loss | PP-R1/PT-R1 |
| renderer uses repeated growing String append | quadratic output | PT-S1 |
| parser retries ambiguous branches from same offset | superlinear backtracking | PT-S1 |

Mutation quality is judged by domain plausibility and requirement coverage, not a score target.
