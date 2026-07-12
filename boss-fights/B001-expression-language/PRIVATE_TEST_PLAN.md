# Private Test Category Plan — B001

Concrete test source/cases remain in external private CI.

| Category | Documented requirements | Failure feedback |
|---|---|---|
| PT-L1 keyword/identifier/ASCII whitespace boundaries | grammar, FR-1/2 | lexical boundary violated |
| PT-P1 empty/truncated/missing delimiter/operand | FR-2/3 | malformed input category accepted or misdiagnosed |
| PT-P2 precedence/left association/unary ambiguity | grammar, FR-2 | AST association/precedence incorrect |
| PT-P3 trailing non-whitespace | FR-3, INV-2 | parser accepts trailing garbage |
| PT-E1 every constructor, unknown name, zero divisor | FR-4..6 | evaluator totality/error category failure |
| PT-E2 duplicate environment and nested shadowing | FR-4/5, INV-3 | lexical shadowing/first-match invariant violated |
| PT-R1 wellFormed AST round trip, adversarial parentheses | FR-7/8, INV-4 | printer changes AST meaning |
| PT-S1 flat/deep n-series, allocation/residency/stack | performance clauses | required scaling/resource class violated |
| PT-A1 source-span change localization | Gate 10 | diagnostic architecture resists documented change |

Hidden integration combines a fair new expression using only documented grammar and requirements. Reports disclose category only.
