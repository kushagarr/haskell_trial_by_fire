# Long-Range Roadmap

This is directional architecture, not a collection of frozen future APIs. Only block 01 is deeply authored. Later modules will be selected and specified shortly before use.

| Phase | Capability outcome | Representative pressure | Likely cumulative work |
|---|---|---|---|
| 00 Orientation | Build, test, profile, read types and diagnostics | warnings, packages, evidence hygiene | toolchain repair drill |
| 01 Algebraic foundations | Model sums/products/recursion and write total functions | exhaustive matching, explicit absence/errors | B001 expression language |
| 02 Abstractions and laws | Use folds and lawful typeclasses because repetition demands them | strictness, productivity, law tests | text utilities revisit |
| 03 Collections and graphs | Select and implement persistent structures and graph algorithms | invariants, cycles, asymptotics | dependency resolver |
| 04 Effects and validation | Separate dependency, accumulation, environment, and state | error taxonomy, effect boundaries | validated configuration engine |
| 05 Parsing and documents | Build manual/combinator/incremental parsers and structured printers | spans, recovery, chunk boundaries | JSON library |
| 06 Languages and compilers | Resolve names, infer/check types, transform IR, execute | diagnostics, typed AST, optimization | miniature compiler |
| 07 Systems foundations | Handle bytes, files, serialization, processes, and resources | exceptions, cleanup, partial I/O | durable log utility |
| 08 Networking | Implement framing, protocol states, TCP/HTTP subsets, streaming | partial reads, timeouts, cancellation | HTTP server/client |
| 09 Concurrency | Design bounded, cancellable concurrent systems | races, STM, backpressure, leaked work | concurrent job runner |
| 10 Storage | Build recovery-aware indexed persistence | checksums, compaction, crash states | mini key-value store |
| 11 Advanced Haskell | Apply GADTs, type states, optics, recursion schemes, Free/Cofree where earned | inference cost, abstraction tradeoffs | typed interpreter refactor |
| 12 Schema and generation | Validate schemas, lower to IR, render deterministically, compile output | name hygiene, evolution, plugins | schema-driven generator |
| 13 Smithy and SDK | Consume a Smithy subset, validate, project, generate, and run one protocol | model resolution, runtime contracts | model consumer, generator, small SDK |
| 14 Capstone | Integrate model, generator, runtime, protocol, tooling, and operations | architecture, observability, migration | cloud/protocol toolkit |

Dependencies and recurrence are in curriculum/PHASE_DEPENDENCIES.md and curriculum/CONCEPT_RECURRENCE.md. Later phase boundaries and boss order may change from evidence; essential capabilities may not be deleted.
