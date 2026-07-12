# Phase Dependency Map

~~~text
Orientation
  -> Algebraic foundations
      -> Abstractions and laws
          -> Collections and graphs
          -> Effects and validation
              -> Parsing and documents
                  -> Languages and compilers
              -> Systems foundations
                  -> Networking
                  -> Storage
                  -> Concurrency
      -> Advanced Haskell (fed by repeated concrete pain across phases)

Parsing + Languages + Systems + Advanced Haskell
  -> Schema systems and code generation
      -> Smithy model work

Networking + Concurrency + Resource safety + Smithy generation
  -> Protocol runtime and small SDK
      -> Capstone
~~~

Cross-cutting prerequisites:

- Totality, invariants, tests, complexity, memory reasoning, and explanation begin in phase 01 and gate every later phase.
- Graphs feed dependency resolution, name resolution, module ordering, Smithy references, and build generation.
- Parsing feeds languages, protocols, schemas, and Smithy diagnostics.
- Resource safety feeds files, networking, concurrency, storage recovery, and SDK runtime.
- Structured documents and deterministic rendering feed pretty printing, compiler diagnostics, and code generation.

Dependency arrows permit overlap when evidence supports it; they do not permit skipping the prerequisite capability.
