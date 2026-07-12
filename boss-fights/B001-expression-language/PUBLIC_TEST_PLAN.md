# Public Test Plan — B001

| Evidence | Contract | Public intent |
|---|---|---|
| UT-P1 literals/whitespace | grammar, FR-2 | lexical baseline |
| UT-P2 precedence/association/unary | grammar, FR-2 | AST shape |
| UT-P3 let/identifier | FR-1/2 | binder syntax |
| UT-P4 empty/malformed/trailing | FR-3, INV-2 | total rejection |
| UT-E1 arithmetic/errors | FR-4/6 | exhaustive evaluator |
| UT-E2 environment/shadow | FR-4/5, INV-3 | scope |
| UT-R1 canonical examples | FR-7 | readable deterministic source |
| PP-R1 parse-pretty | FR-7/8, INV-4 | exact AST round trip |
| PP-E1 arithmetic model subset | FR-4/6 | independent evaluator evidence |

Public generator uses wellFormed bounded ASTs and structural shrinking. Exact adversarial distributions, deep sizes, and hidden integration syntax changes remain private.
