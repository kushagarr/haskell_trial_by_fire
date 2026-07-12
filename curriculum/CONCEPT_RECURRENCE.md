# Concept Recurrence Map

| Concept | Direct encounter | Abstraction/refactor | Independent transfer |
|---|---|---|---|
| Totality | M001 exhaustive ADTs | M005/M006 explicit absence/errors | protocol and model validation |
| Structural recursion | M002 list, M004 tree | Foldable/Traversable and recursion schemes | compiler/Smithy traversals |
| Strictness | M003 folds | strict fields, streaming folds | large model/codegen and server pipelines |
| Productivity | M003 lazy prefixes | streaming abstractions | incremental protocol bodies |
| Invariants | M004 trees | smart constructors/type states | resolved Smithy models and protocol states |
| Error taxonomy | M005/M006 | applicative validation/ExceptT boundaries | compiler diagnostics and SDK errors |
| Algebraic laws | M007 | Functor/Applicative/Traversable laws | merge models and incremental updates |
| Test quality | M008 mutant killing | model/property/state-machine testing | concurrent/network protocol testing |
| Parsing | B001 manual parser | parser combinators and incremental parsing | JSON, HTTP, schema, Smithy inputs |
| Pretty printing | B001 precedence | document algebra | deterministic multi-backend generation |
| Graph reachability | collection phase | SCC/topological abstractions | dependency resolver and shape references |
| Resource safety | file handles | managed resources/masking | sockets, cancellation, storage recovery |
| Concurrency bounds | explicit worker queue | STM/structured concurrency | HTTP pools and SDK retries |
| IR design | expression AST transformations | typed IR/passes | schema-to-Haskell generator |

Future block proposals must add or adjust rows rather than assuming a concept is learned after one appearance.
