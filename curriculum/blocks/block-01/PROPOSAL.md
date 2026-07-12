# Block 01 Proposal (pre-implementation)

PROPOSAL_STATUS: REVIEWED_AND_REVISED

This proposal intentionally contains eight modules and one boss, the maximum rolling block size, because each capability is required by B001 and no later phase is deeply authored.

| ID | Capability | Prerequisites | Likely weak implementation | Invariants/edges | Performance/memory risk | Motivation and recurrence |
|---|---|---|---|---|---|---|
| M001 | Total case analysis over domain ADTs | type reading | wildcard/default swallowing cases; partial pattern | all constructors, boundary transitions, no partiality | repeated traversal | explicit failure in M005/M006; protocol states later |
| M002 | Design operations over a custom recursive list | M001 | append-driven quadratic work; partial head/tail | empty/singleton, order, length, infinite prefixes | reverse stack/allocation; productivity | folds M003; Foldable; streaming |
| M003 | Choose folds/evaluation for finite and infinite data | M002 | foldl thunk chain; forcing infinite tails; quadratic append | equivalence laws, finite/infinite distinction | thunk retention, stack, n/2n/4n | streaming and large pipelines |
| M004 | Preserve tree invariants through traversals | M001–M003 | repeated subtree scans; incomplete constructors; non-stack-aware traversal | empty, skew, duplicates policy, traversal order | quadratic height/size; deep stack | Foldable/Traversable; AST/model passes |
| M005 | Model absence explicitly and compose optional lookup | M001 | sentinel values; fromJust; recomputation | missing at each stage, legitimate zero/empty | duplicate lookup/traversal | parsers, maps, caches, Smithy references |
| M006 | Build structured, contextual, total errors | M005 | stringly errors; fail-late ambiguity; first-error loss | stable taxonomy, path context, all failure boundaries | repeated append in context | validation, compiler and protocol diagnostics |
| M007 | Design lawful compositional summaries | M003/M006 | arbitrary instances; wrong identity/order | associativity, identities, order-sensitive evidence | repeated concatenation and lazy aggregates | Foldable, validation accumulation, metrics |
| M008 | Write properties that distinguish valid code from plausible mutants | M001–M007 | tautologies; reimplementing SUT; poor generators | validity distribution, shrinking, independent oracle | oversized generators; nontermination | state-machine/network/concurrency testing |
| B001 | Integrate an expression language | M001–M008 | parser accepts prefix, partial evaluator, ambiguous printer, string-only errors | grammar, precedence, scope, trailing input, diagnostics, round trip | quadratic parsing/rendering, deep AST stack | combinators, typed AST, IR, compiler diagnostics |

The boss supplies a small documented manual-parser interface but does not introduce parser combinators, static typing, GADTs, or compiler IR. Later revisits add those after motivation.
