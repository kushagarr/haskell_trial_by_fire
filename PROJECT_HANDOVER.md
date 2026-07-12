# Codex CLI Handover: Expert Systems Programming Apprenticeship in Haskell

## 1. Your role

You are responsible for designing and maintaining a rigorous, long-form Haskell apprenticeship repository.

This is not a beginner tutorial, a collection of toy exercises, a LeetCode clone, or a code-generation task where the agent completes implementations for the learner.

The repository must train the learner to become capable of designing, implementing, testing, optimizing, and maintaining substantial systems in Haskell.

The learner’s long-term interests include:

* Smithy modeling;
* Smithy validation;
* code generation;
* AWS SDK generation and runtime design;
* network programming;
* HTTP clients and servers;
* streaming;
* resource safety;
* concurrency;
* parsers and compilers;
* type checking;
* intermediate representations;
* protocol implementation;
* persistent data structures;
* systems architecture;
* advanced and occasionally esoteric Haskell concepts that have practical value.

Smithy and an AWS SDK are important long-term objectives, but the curriculum must not be narrowly shaped around them.

The broader goal is:

> Develop expert-level systems-programming judgment using Haskell.

The curriculum must use repeated practical pressure to make abstractions necessary and memorable.

---

# 2. Core educational philosophy

## 2.1 Trial by fire

The learner should not complete a module merely by writing code that passes a few obvious examples.

Each meaningful module must require the learner to demonstrate several dimensions of competence:

* functional correctness;
* totality;
* edge-case handling;
* algebraic-law compliance where applicable;
* appropriate asymptotic complexity;
* acceptable memory behavior;
* sound API design;
* maintenance of documented invariants;
* test quality;
* architectural clarity;
* ability to explain the solution;
* ability to adapt the design to changed requirements.

The exercises must be demanding but fair.

Difficulty should come from the depth of the problem, not from vague requirements, undocumented tricks, arbitrary syntax puzzles, or fragile timing thresholds.

## 2.2 Abstractions must earn their existence

Do not introduce advanced Haskell concepts as isolated vocabulary lessons.

The learner should first experience the concrete problem that motivates the abstraction.

Examples:

* introduce `Functor` after repeated structure-preserving mapping becomes obvious;
* introduce `Foldable` after repeated aggregation traversals;
* introduce `Traversable` after repeated effectful structure traversal;
* introduce applicative validation after the learner experiences the inadequacy of fail-fast validation;
* introduce `Reader` after repeated environment threading;
* introduce `State` after explicit state threading becomes burdensome;
* introduce parser combinators after writing direct recursive parsers;
* introduce recursion schemes after writing multiple structurally identical recursive traversals;
* introduce `Free` after tightly coupling program descriptions to their interpreter;
* introduce `Cofree` after repeatedly attaching annotations to recursive structures;
* introduce GADTs after encountering runtime-invalid AST states;
* introduce `DataKinds` and phantom states after invalid lifecycle transitions become possible;
* introduce type families only when they solve a genuine family-of-types problem;
* introduce optics only after repeated nested updates become painful;
* introduce streaming abstractions only after eager processing fails memory requirements.

The learner should feel the need before receiving the abstraction.

## 2.3 Every important concept must recur

Important concepts must appear in at least three contexts:

1. an initial direct or manually implemented form;
2. a later abstraction or refactoring;
3. a still-later independent application where the learner is expected to recognize the pattern without being told.

A concept is not considered learned because one module passed.

## 2.4 The curriculum must spiral

Earlier modules must return under stricter requirements.

Examples:

* revisit a list implementation after learning strict folds;
* revisit trees after learning `Functor`, `Foldable`, and `Traversable`;
* revisit a parser after learning parser combinators;
* revisit an AST after learning GADTs;
* revisit an eager processor after learning streaming;
* revisit a recursive traversal after learning recursion schemes;
* revisit an HTTP client after learning cancellation, timeouts, and resource safety;
* revisit a code generator after learning structured pretty printing;
* revisit validation after learning applicative error accumulation;
* revisit graph algorithms with performance and memory constraints;
* revisit earlier APIs after introducing extensibility requirements.

The learner should repeatedly improve old designs using newer knowledge.

---

# 3. Non-negotiable tutor restrictions

The learner must write the exercise implementations.

You must not turn the repository into an agent-completed codebase.

Create a root-level `AGENTS.md` containing strict instructions equivalent to the following rules.

## 3.1 Prohibited behavior

The tutor or coding agent must not:

* implement exercise bodies for the learner;
* replace `undefined`, `error "TODO"`, holes, or stubs with complete working solutions;
* produce full solutions in chat;
* provide directly translatable full pseudocode;
* reveal hidden-test source code;
* reveal the exact private reference implementation;
* weaken tests to make an implementation pass;
* remove meaningful edge cases;
* increase performance thresholds merely to accept weak code;
* disable warnings;
* introduce unsafe operations to bypass intended reasoning;
* change public APIs unless the exercise specification is inconsistent;
* modify learner-owned implementation files unless explicitly operating in a separate authoring mode;
* silently solve compilation problems by rewriting the implementation;
* generate a completed submission under the guise of refactoring;
* use broad code generation to fill exercise modules;
* certify a module based only on superficial unit-test success.

## 3.2 Permitted behavior

The tutor may:

* explain compiler messages;
* identify the missing concept;
* restate an invariant;
* identify a relevant type signature;
* identify a relevant library module or function;
* ask leading questions;
* provide a minimal unrelated example;
* show a counterexample to the learner’s current approach;
* point out a complexity problem;
* identify a likely space leak;
* explain why a test fails;
* review code already written by the learner;
* explain tradeoffs between alternative designs;
* suggest what to read before retrying;
* provide progressively stronger hints under a formal hint ladder;
* create or strengthen tests in curriculum-author mode;
* update progress documentation;
* produce assessment reports;
* inspect code without editing it.

## 3.3 Hint ladder

Hints must be given in this order unless the learner explicitly requests a stronger level.

### Level 0: Requirement restatement

Restate the invariant, law, or behavior that is not being met.

### Level 1: Concept identification

Name the concept involved, such as structural recursion, strict accumulation, graph reachability, parser backtracking, or resource bracketing.

### Level 2: Relevant interface

Point to a relevant type signature, typeclass method, standard-library function, or module.

### Level 3: Smaller analogous problem

Provide a simpler, separate example that demonstrates the same idea without solving the exercise.

### Level 4: Structural observation

Describe one meaningful structural step, decomposition, or intermediate representation.

### Level 5: Counterexample or intermediate type

Reveal a concrete failing case or a useful intermediate type.

### Level 6: Partial scaffolding

Provide limited scaffolding only when the learner explicitly asks for it.

Even at Level 6, do not provide the complete final implementation.

---

# 4. Repository as the source of truth

Do not depend on chat history as the primary source of project intent.

All important design decisions must be written into the repository.

Create and maintain at least:

```text
AGENTS.md
README.md
COURSE.md
CURRICULUM_PRINCIPLES.md
ASSESSMENT.md
CONTRIBUTING.md
ROADMAP.md
```

The repository must explain:

* the educational philosophy;
* tutor restrictions;
* module structure;
* assessment gates;
* progression rules;
* how hints work;
* how hidden tests work;
* how performance is measured;
* how modules are revisited;
* how boss fights work;
* how learner progress is recorded;
* how curriculum-author mode differs from learner mode.

Do not compress these ideas into a short README.

The repository documentation must be explicit enough that a fresh Codex session cannot reasonably reinterpret the project as an ordinary code-completion task.

---

# 5. Operating modes

The repository must define two clearly separated modes.

## 5.1 Curriculum-author mode

In this mode, the agent may:

* design modules;
* create stubs;
* write public tests;
* design private tests;
* write reference solutions in an inaccessible location;
* create benchmarks;
* create mutation tests;
* create assessment rubrics;
* update course documentation;
* create boss fights;
* create CI configuration.

Curriculum-author mode must not be used while the learner is attempting a module unless explicitly requested.

## 5.2 Learner-tutor mode

In this mode, the agent must:

* inspect but not complete the learner’s code;
* run tests;
* run static analysis;
* explain failures;
* provide hints under the hint ladder;
* review invariants, complexity, and architecture;
* update assessment notes;
* refuse requests for direct exercise solutions unless the user explicitly suspends the educational restriction.

Separate commands or documented workflows should make the active mode unambiguous.

Prefer technical enforcement where possible.

For example:

* learner-owned directories should be protected from automated edits;
* curriculum-author tooling should require an explicit flag;
* tutor scripts should default to read-only review behavior;
* CI should detect changes that weaken tests;
* private reference material should not exist in the learner-visible checkout.

---

# 6. Required repository structure

Design a maintainable multi-package or well-separated Cabal project.

A reasonable starting structure is:

```text
haskell-systems-apprenticeship/
├── AGENTS.md
├── README.md
├── COURSE.md
├── ROADMAP.md
├── CURRICULUM_PRINCIPLES.md
├── ASSESSMENT.md
├── CONTRIBUTING.md
├── cabal.project
├── fourmolu.yaml
├── hlint.yaml
│
├── curriculum/
│   ├── phase-00-orientation/
│   ├── phase-01-foundations/
│   ├── phase-02-abstractions/
│   ├── phase-03-data-structures/
│   ├── phase-04-parsing/
│   ├── phase-05-languages/
│   ├── phase-06-systems/
│   ├── phase-07-networking/
│   ├── phase-08-concurrency/
│   ├── phase-09-code-generation/
│   ├── phase-10-smithy/
│   └── phase-11-capstones/
│
├── exercises/
│   ├── M001/
│   │   ├── README.md
│   │   ├── DESIGN.md
│   │   ├── src/
│   │   ├── test-public/
│   │   ├── benchmark/
│   │   ├── fixtures/
│   │   └── assessment.yaml
│   └── ...
│
├── boss-fights/
│   ├── B001-expression-language/
│   ├── B002-json-library/
│   ├── B003-dependency-resolver/
│   ├── B004-http-server/
│   ├── B005-compiler/
│   ├── B006-smithy-model/
│   └── ...
│
├── support/
│   ├── assessment-runner/
│   ├── mutation-runner/
│   ├── complexity-checks/
│   ├── forbidden-api-checks/
│   ├── compile-checks/
│   └── reporting/
│
├── progress/
│   ├── learner-profile.md
│   ├── journal.md
│   ├── completed-modules.md
│   ├── weaknesses.md
│   └── review-schedule.md
│
├── private-assessment/
│   └── README.md
│
└── docs/
    ├── concepts/
    ├── reading/
    ├── papers/
    ├── style/
    └── architecture/
```

Adapt this structure if a better design emerges, but preserve the separation of:

* course materials;
* learner implementations;
* public tests;
* performance checks;
* assessment metadata;
* boss fights;
* private evaluation;
* progress records;
* infrastructure.

---

# 7. Module format

Every module must contain a complete written contract.

Each module’s `README.md` should include:

## 7.1 Purpose

What engineering ability the module develops.

## 7.2 Prerequisites

Previously completed modules and concepts.

## 7.3 Problem statement

Clear functional requirements.

## 7.4 Public API

Exact types and modules the learner must implement.

## 7.5 Invariants

Explicitly documented conditions that must always hold.

Examples:

* keys remain unique;
* output preserves input order;
* tree balance factor remains bounded;
* all references point to existing nodes;
* parser consumes only valid prefixes;
* resources are released on synchronous and asynchronous exceptions;
* no invalid state transition can occur;
* retries do not repeat non-idempotent requests unless allowed.

## 7.6 Complexity requirements

Document expected asymptotic complexity where meaningful.

Examples:

* lookup must be logarithmic or amortized constant-time;
* traversal must be linear in nodes plus edges;
* rendering must avoid repeated quadratic concatenation;
* queue operations must satisfy required amortized bounds;
* parser must not perform uncontrolled exponential backtracking.

## 7.7 Memory and strictness expectations

State whether the implementation must:

* work productively on infinite structures;
* process large finite inputs in bounded memory;
* use strict accumulation;
* avoid retaining input unnecessarily;
* stream rather than buffer;
* be stack-safe for a stated input size.

## 7.8 Forbidden shortcuts

List APIs or techniques prohibited for that exercise.

Examples:

* no use of `Data.List.reverse` in a reverse exercise;
* no use of `Data.Map` while implementing a search tree;
* no `unsafePerformIO`;
* no partial functions;
* no parser library in a manual parser module;
* no direct use of the eventual abstraction before it is introduced.

## 7.9 Public examples

Provide enough examples to explain the contract without revealing the complete test strategy.

## 7.10 Completion gates

List exactly which gates apply.

## 7.11 Reflection questions

Require written answers before the module is considered complete.

## 7.12 Further challenge

Optional extensions that do not block progress.

---

# 8. Assessment gates

Not every small module requires every gate, but substantial modules must use multiple independent gates.

## Gate 0: Design review

Before implementation, require a short `DESIGN.md` for suitable modules.

It should answer:

* What are the data invariants?
* Why were these types selected?
* What operations dominate runtime?
* What is the expected complexity?
* Where can partiality arise?
* How will errors be represented?
* What invalid states should be made unrepresentable?
* What behavior depends on laziness or strictness?
* How will the solution be tested?

The tutor may challenge the design but must not dictate the final implementation.

## Gate 1: Compilation

Requirements may include:

```text
-Wall
-Wcompat
-Widentities
-Wincomplete-patterns
-Wincomplete-record-updates
-Wincomplete-uni-patterns
-Wmissing-export-lists
-Wmissing-signatures
-Wredundant-constraints
-Werror
```

Apply warning sets sensibly. Do not introduce noisy or pedagogically irrelevant warnings without explanation.

## Gate 2: Public example tests

Use concrete examples for the visible contract.

## Gate 3: Property tests

Use QuickCheck or Hedgehog where algebraic or generative properties are appropriate.

Properties may include:

* identity;
* composition;
* associativity;
* round trips;
* preservation of size or order;
* idempotence;
* model normalization stability;
* parser-renderer agreement;
* graph invariants;
* reference resolution invariants;
* lawful typeclass behavior.

## Gate 4: Adversarial tests

Test:

* empty input;
* singleton input;
* extreme nesting;
* duplicated values;
* cycles;
* disconnected graphs;
* malformed encodings;
* ambiguous syntax;
* large input;
* unusual Unicode;
* repeated failures;
* cancellation;
* partial network reads;
* truncated messages;
* timer races;
* exception paths;
* resource exhaustion where safely testable.

## Gate 5: Totality and forbidden API checks

Reject forbidden or unjustified uses of:

```haskell
undefined
error
head
tail
init
last
fromJust
read
unsafePerformIO
```

This list should be exercise-sensitive rather than globally naive.

For example, `error` may be acceptable inside deliberately unreachable private test scaffolding but not learner production code.

## Gate 6: Mutation testing

Introduce plausible faults such as:

* omit one constructor;
* change a boundary comparison;
* reverse output;
* skip validation;
* ignore duplicate identifiers;
* discard one accumulated error;
* remove a visited-set update;
* retry one time too many;
* fail to close a resource on one exception path;
* parse a prefix while ignoring trailing garbage;
* generate code in nondeterministic order.

The public and private test suites should kill meaningful mutants.

Do not pursue mutation-score vanity. Mutants must represent realistic faults.

## Gate 7: Performance qualification

Prefer relative scaling tests and allocation checks over exact wall-clock deadlines.

Test data sizes such as:

```text
n
2n
4n
```

Estimate whether growth matches the required complexity class.

Use generous, stable thresholds.

Performance evaluation should account for:

* asymptotic behavior;
* allocation growth;
* stack usage;
* repeated traversal;
* accidental list append behavior;
* unnecessary conversion between collections;
* retained structures;
* excessive parser backtracking;
* lock contention;
* unbounded queues.

## Gate 8: Memory and strictness

Use suitable GHC RTS statistics, heap profiles, or controlled tests.

Check for:

* `foldl` space leaks;
* retained heads of lazy lists;
* accumulation of unevaluated thunks;
* whole-input buffering;
* unbounded channels;
* failure to release references;
* non-streaming implementations where streaming is required.

## Gate 9: Streaming and incremental behavior

Where relevant, require processing input in chunks.

Tests should verify:

* bounded memory;
* correct behavior across arbitrary chunk boundaries;
* correct handling of empty chunks;
* cancellation;
* final partial chunks;
* incremental parser state;
* backpressure;
* resource closure.

## Gate 10: Architecture and extensibility

Introduce a documented change after the initial implementation.

Examples:

* add a new AST constructor;
* add a new Smithy shape;
* add a protocol variation;
* add a new output backend;
* add comments to a parser;
* add source locations;
* add cancellation;
* add a new validation pass;
* switch from one renderer to multiple targets.

Assess how localized the change is.

Do not demand speculative abstraction in early stages. The purpose is to test whether the design can evolve reasonably.

## Gate 11: Explanation and defense

Require the learner to answer questions such as:

* Why does the function terminate?
* What invariant is preserved?
* What is the time complexity?
* What is the space complexity?
* Is it productive on infinite input?
* Which operations are strict?
* Why is this typeclass instance lawful?
* Why was this data structure selected?
* What counterexample breaks a simpler implementation?
* What happens under asynchronous exception?
* Which parts of the type encode domain knowledge?
* What would need to change for a new requirement?

A module does not receive high certification if the learner cannot explain it.

## Gate 12: Refactoring round

After learning a relevant abstraction, require revisiting the solution.

The refactoring must not be accepted merely because it is shorter.

Evaluate whether it improves:

* correctness;
* composability;
* clarity;
* extensibility;
* performance;
* invariant expression;
* testability.

## Gate 13: Hidden integration challenge

Occasionally provide a new task that combines previously learned concepts without a detailed recipe.

It must still have a fair contract and must not rely on undocumented knowledge.

---

# 9. Certification levels

Use quality tiers, but avoid turning them into superficial gamification.

A possible model:

## Bronze

* compiles;
* public correctness tests pass;
* no unfinished stubs remain.

## Silver

* private correctness and edge-case tests pass;
* basic invariants hold;
* implementation is total under the documented contract.

## Gold

* property tests pass;
* required complexity and memory targets pass;
* code is maintainable;
* explanation is satisfactory.

## Platinum

* strong architecture;
* robust tests;
* mutation suite performs well;
* handles changed requirements cleanly;
* documentation is professional.

## Diamond

* production-quality work;
* excellent API judgment;
* sound performance;
* strong failure handling;
* could plausibly be reviewed for use in a serious library.

Not every module needs all tiers.

The learner should be allowed to progress after reaching a defined minimum, while older modules can later be upgraded.

---

# 10. Hidden tests and secrecy

Do not place truly hidden tests, reference solutions, or answer keys in the learner-visible repository.

Codex CLI can inspect local files.

Therefore:

* public tests live in the learner repository;
* hidden tests should run in a separate private repository or private CI environment;
* reference solutions should be inaccessible during learner mode;
* assessment reports may disclose the category of failure without revealing the exact hidden case;
* hidden tests must correspond to documented requirements;
* do not use hidden tests for arbitrary formatting preferences or undocumented behavior.

A hidden-test failure report should say things such as:

* “fails on a deeply skewed tree”;
* “violates the documented duplicate-key invariant”;
* “allocation growth exceeds the linear target”;
* “resource remains open after asynchronous cancellation”;
* “parser incorrectly accepts trailing input.”

It should not reveal the full private test implementation.

---

# 11. Test-suite integrity

The learner must eventually learn to write tests, not only satisfy them.

Progression should be:

1. tests are mostly supplied;
2. learner adds missing examples;
3. learner writes properties;
4. learner is given buggy implementations and must create tests that expose them;
5. learner writes the full public suite;
6. learner designs mutation operators;
7. learner defends why the suite is adequate.

CI should detect attempts to weaken assessment.

Possible controls:

* store approved test hashes in private CI;
* compare test-count and property metadata;
* reject deletion of mandatory cases;
* run private mutants;
* verify benchmark configurations;
* inspect changes to warning flags;
* prevent excluding modules from the build.

Do not equate line coverage with test quality.

---

# 12. Curriculum scope

The curriculum should cover the following pillars.

## 12.1 Haskell foundations

* expressions and evaluation;
* purity;
* functions;
* currying;
* pattern matching;
* algebraic data types;
* product and sum types;
* recursive types;
* parametric polymorphism;
* newtypes;
* modules;
* type inference;
* laziness;
* strictness;
* equational reasoning;
* structural recursion.

## 12.2 Core abstractions

* semigroups and monoids;
* functors;
* applicatives;
* monads;
* alternatives;
* foldables;
* traversables;
* bifunctors where useful;
* contravariance where useful;
* profunctors only when practically motivated;
* comonads only after concrete motivation;
* natural transformations;
* laws and law testing.

## 12.3 Data structures

Implement or study suitable examples of:

* custom lists;
* non-empty structures;
* stacks;
* queues;
* deques;
* binary search trees;
* balanced trees;
* heaps;
* tries;
* radix or Patricia-style structures;
* hash-oriented structures conceptually;
* disjoint sets;
* priority queues;
* difference lists;
* sequences;
* zippers;
* finger trees;
* graphs;
* persistent data structures;
* immutable indexing structures;
* selected string-search structures.

Not all need full production implementations. Choose exercises based on conceptual value.

## 12.4 Algorithms

* sorting;
* searching;
* graph traversal;
* topological ordering;
* strongly connected components;
* cycle detection;
* shortest paths;
* dependency resolution;
* union-find;
* tree rewriting;
* memoization;
* dynamic programming;
* unification;
* substitution;
* matching;
* diff algorithms;
* incremental recomputation;
* selected text algorithms;
* scheduling and work queues.

## 12.5 Parsing and language implementation

* hand-written recursive parsers;
* tokenization;
* parser combinators;
* precedence and associativity;
* ambiguity;
* error recovery;
* source spans;
* incremental parsing;
* streaming parsing;
* AST design;
* concrete versus abstract syntax;
* pretty printing;
* round-trip properties.

## 12.6 Compiler fundamentals

* lexical analysis;
* parsing;
* name resolution;
* scopes;
* symbol tables;
* type checking;
* Hindley–Milner-style inference at an appropriate stage;
* unification;
* typed ASTs;
* desugaring;
* intermediate representations;
* control-flow basics;
* optimization passes;
* constant folding;
* dead-code elimination;
* data-flow basics;
* code generation;
* bytecode or a small virtual machine;
* diagnostics;
* source mapping.

## 12.7 Code generation

* structured document models;
* pretty printers;
* deterministic output;
* name hygiene;
* escaping;
* module dependency ordering;
* generated-code compilation tests;
* golden tests;
* source maps;
* intermediate representations;
* multiple backends;
* incremental generation;
* schema evolution;
* plugin architecture.

## 12.8 Network programming

* sockets;
* TCP;
* UDP;
* framing;
* partial reads and writes;
* binary protocols;
* text protocols;
* timeouts;
* cancellation;
* DNS concepts;
* TLS usage;
* HTTP/1.1;
* chunked transfer;
* connection reuse;
* pooling;
* request and response streaming;
* WebSockets at a later stage;
* HTTP/2 concepts where feasible;
* backpressure;
* protocol state machines;
* defensive parsing.

## 12.9 Concurrency and parallelism

* threads;
* `MVar`;
* `Chan`;
* bounded queues;
* STM;
* `TVar`;
* `TMVar`;
* `TBQueue`;
* `async`;
* cancellation;
* structured concurrency;
* worker pools;
* deadlocks;
* livelocks;
* starvation;
* race conditions;
* deterministic testing where possible;
* parallel evaluation;
* sparks;
* contention and throughput.

## 12.10 Resource safety and effects

* exceptions;
* synchronous versus asynchronous exceptions;
* `bracket`;
* masking;
* cleanup;
* handles and sockets;
* managed resources;
* finalizers and why not to rely on them;
* effect boundaries;
* `ReaderT`;
* `State`;
* `ExceptT`;
* transformer ordering;
* effect-system tradeoffs only after fundamentals;
* logging and tracing;
* deterministic core with effectful shell.

## 12.11 Storage and databases

* file formats;
* journaling concepts;
* append-only logs;
* checksums;
* indexing;
* transactions;
* write-ahead logging concepts;
* key-value stores;
* B-tree concepts;
* crash consistency;
* serialization;
* compaction;
* query evaluation basics;
* relational algebra fundamentals.

## 12.12 Advanced Haskell

Introduce only when motivated:

* GADTs;
* phantom types;
* `DataKinds`;
* kind polymorphism;
* type families;
* associated types;
* existential types;
* rank-N types;
* higher-rank callbacks;
* constraint kinds;
* quantified constraints;
* singletons;
* roles and coercions;
* generic programming;
* deriving strategies;
* recursion schemes;
* `Free`;
* `Cofree`;
* tagless-final encodings;
* optics;
* lenses;
* prisms;
* traversals;
* linear types where a meaningful exercise can be designed;
* category-theory vocabulary after practical familiarity.

## 12.13 Architecture and engineering

* package boundaries;
* module design;
* API stability;
* semantic versioning;
* error taxonomies;
* configuration;
* dependency minimization;
* logging;
* metrics;
* observability;
* testing strategies;
* benchmarking;
* profiling;
* documentation;
* CI;
* release workflows;
* code review;
* migration planning;
* compatibility;
* generated versus handwritten code boundaries.

---

# 13. Boss fights

Boss fights must combine multiple previously learned concepts.

They should not introduce large amounts of completely new theory without preparation.

Suggested sequence:

## Boss 1: Unix-style text utilities

Build selected utilities such as:

* `wc`;
* `grep`;
* `uniq`;
* `sort` subset.

Later revisit them with streaming and large-input constraints.

## Boss 2: JSON library

Implement:

* JSON AST;
* parser;
* renderer;
* round-trip properties;
* useful errors;
* large-input behavior.

Later revisit with streaming or incremental parsing.

## Boss 3: Expression language

Implement:

* parser;
* AST;
* evaluator;
* variables;
* scopes;
* pretty printer;
* error reporting.

Later add static typing and typed ASTs.

## Boss 4: Dependency resolver

Implement:

* graph construction;
* reachability;
* cycle reporting;
* topological layers;
* deterministic output;
* useful diagnostics.

This should prepare for package management and Smithy model dependencies.

## Boss 5: Miniature compiler

Implement:

* lexer;
* parser;
* name resolution;
* type checking;
* IR;
* optimizer;
* bytecode or simple code generation;
* diagnostics.

## Boss 6: Concurrent job runner

Implement:

* bounded worker pool;
* cancellation;
* retries;
* timeout handling;
* deterministic tests;
* no leaked threads;
* backpressure.

## Boss 7: HTTP server

Implement an educational but real server subset:

* socket accept loop;
* request framing;
* partial reads;
* response serialization;
* keep-alive where appropriate;
* timeouts;
* resource cleanup;
* concurrency limits.

Do not aim to replace mature libraries.

## Boss 8: HTTP client

Implement:

* requests;
* responses;
* streaming bodies;
* connection reuse;
* timeouts;
* cancellation;
* retry policy;
* idempotency awareness;
* resource safety.

## Boss 9: Mini key-value store

Implement:

* append-only log;
* checksums;
* index;
* recovery;
* compaction;
* crash-oriented tests where practical.

## Boss 10: Schema-driven code generator

Use a small custom schema language before Smithy.

Implement:

* schema parser;
* semantic model;
* validation;
* Haskell IR;
* pretty printer;
* generated-code compile tests;
* deterministic output.

## Boss 11: Smithy model consumer

Prefer initially consuming Smithy JSON AST rather than rebuilding the entire Smithy ecosystem.

Implement a meaningful subset:

* shape IDs;
* namespaces;
* string, number, boolean, list, map, structure, union;
* operations;
* services;
* traits;
* source locations where available;
* reference resolution;
* validation.

## Boss 12: Smithy-to-Haskell generator

Implement:

* validated model input;
* Haskell declaration IR;
* naming rules;
* deterministic module generation;
* imports;
* generated-code compilation;
* golden tests;
* useful unsupported-feature errors.

## Boss 13: Protocol runtime

Implement one focused protocol for a controlled test service.

Cover:

* serialization;
* request construction;
* response decoding;
* structured errors;
* streaming where required;
* retry classification;
* cancellation.

## Boss 14: Small SDK

Generate and run a client for a small Smithy-defined service.

Do not initially target every AWS service or protocol.

## Final capstone: Haskell cloud and protocol toolkit

A cohesive project may include:

* Smithy model ingestion;
* validation;
* code generation;
* runtime;
* HTTP;
* streaming;
* retry;
* authentication abstraction;
* CLI;
* testing;
* benchmarking;
* documentation.

This is a long-term direction, not an early milestone.

---

# 14. Suggested module progression

Design a detailed roadmap, but do not generate hundreds of shallow modules.

Prefer fewer substantial modules with revisit rounds.

A possible outline:

## Phase 0: Orientation and tooling

* GHC, Cabal, REPL;
* compiler warnings;
* project layout;
* tests;
* formatting;
* basic profiling;
* reading types.

## Phase 1: Algebraic foundations

* sums;
* products;
* recursion;
* pattern matching;
* custom lists;
* `Maybe`;
* `Either`;
* invariants;
* total functions.

## Phase 2: Recursion and folds

* structural recursion;
* folds;
* strictness;
* infinite structures;
* asymptotic reasoning;
* stack behavior.

## Phase 3: Typeclasses and laws

* `Eq`;
* `Ord`;
* `Semigroup`;
* `Monoid`;
* `Functor`;
* law testing.

## Phase 4: Collections and graphs

* maps;
* sets;
* queues;
* trees;
* graphs;
* traversal;
* cycles;
* SCCs;
* dependency resolution.

## Phase 5: Effects and validation

* applicative composition;
* monadic dependency;
* error accumulation;
* `Reader`;
* explicit state;
* `State`;
* `ExceptT`;
* transformer tradeoffs.

## Phase 6: Parsing and documents

* manual parsing;
* combinators;
* error reporting;
* source spans;
* pretty printing;
* round trips;
* incremental input.

## Phase 7: Language implementation

* scopes;
* name resolution;
* unification;
* type inference;
* typed ASTs;
* IR;
* optimization;
* execution.

## Phase 8: Systems foundations

* bytes;
* encoding;
* files;
* serialization;
* resource safety;
* exceptions;
* process interaction.

## Phase 9: Networking

* TCP;
* framing;
* HTTP;
* streaming;
* timeouts;
* connection management;
* cancellation.

## Phase 10: Concurrency

* `MVar`;
* STM;
* `async`;
* worker pools;
* structured cancellation;
* backpressure;
* race testing.

## Phase 11: Advanced abstractions

* recursion schemes;
* zippers;
* `Free`;
* `Cofree`;
* GADTs;
* type-level states;
* optics;
* generic programming.

Only introduce each after a motivating earlier problem.

## Phase 12: Schema systems and code generation

* schema AST;
* semantic model;
* validation;
* IR;
* deterministic rendering;
* generated-code tests.

## Phase 13: Smithy and SDK work

* Smithy JSON AST;
* model normalization;
* traits;
* validation;
* service projection;
* Haskell code generation;
* protocol runtime;
* one small SDK.

---

# 15. Performance requirements

Performance education must be integrated from early stages.

Teach and test:

* operation counting;
* asymptotic complexity;
* strict versus lazy folds;
* allocation;
* sharing;
* fusion concepts;
* builder patterns;
* difference lists;
* text and bytestring choices;
* boxed versus unboxed representation at an appropriate stage;
* profiling;
* heap residency;
* cost centers;
* concurrency throughput;
* contention;
* queue bounds;
* streaming.

Do not make every early exercise micro-optimized.

Use a progression:

1. correct;
2. total;
3. measurable;
4. asymptotically appropriate;
5. allocation-aware;
6. architecture-aware.

Optimization tests must be stable.

Avoid exact microsecond requirements.

Prefer:

* complexity ratios;
* operation counters;
* allocation bounds;
* maximum residency bounds;
* timeout only as a broad safety net;
* comparison against deliberately poor baselines.

Require benchmark explanations.

The learner must explain what is being measured and what conclusions are valid.

---

# 16. Invariants and type-driven design

The curriculum must repeatedly force the learner to identify and encode invariants.

Examples:

* `NonEmpty` for guaranteed non-empty collections;
* distinct newtypes for namespace, shape name, member name, and protocol identifiers;
* validated and unvalidated model types;
* signed and unsigned request states;
* open and closed resource states where appropriate;
* typed expressions;
* resolved and unresolved references;
* canonical and noncanonical representations;
* parsed and rendered document forms;
* idempotent versus non-idempotent operations;
* bounded queue sizes;
* protocol-state transitions.

Do not push every invariant into types.

Teach tradeoffs:

* compile-time safety;
* runtime flexibility;
* ergonomics;
* inference complexity;
* error quality;
* API stability;
* serialization boundaries.

The learner must justify when an invariant belongs in the type system and when runtime validation is better.

---

# 17. Advanced and esoteric concepts

The course must include advanced concepts, but they must remain applicable.

Examples of appropriate motivations:

## Recursion schemes

Introduce after many repeated recursive traversals.

Require the learner to compare explicit recursion and a recursion-scheme version.

Assess whether the abstraction helps or obscures.

## `Free`

Introduce when separating a program description from interpretation.

Use an exercise involving:

* request descriptions;
* test interpreters;
* logging interpreters;
* simulation;
* production effects.

Also compare with a simpler algebra plus interpreter and tagless-final style.

## `Cofree`

Introduce when annotating every node of a recursive structure.

Possible annotations:

* source spans;
* inferred types;
* optimization facts;
* generated symbols;
* dependency metadata.

## Comonads

Introduce using contextual computation, annotated trees, cellular automata, or data-flow context.

Do not introduce only through abstract laws.

## GADTs

Use typed expressions or protocol-state machines.

Require invalid programs to become unrepresentable.

## Type families

Use protocol-associated types or backend-specific representations where an ordinary type parameter becomes insufficient.

Require discussion of error-message and inference costs.

## Existentials and rank-N types

Use heterogeneous interpreters, plugin boundaries, resource scopes, or callback capabilities.

## Optics

Introduce after nested immutable updates and traversals become repetitive.

Require comparison with direct record updates.

## Linear types

Include only if a practical and toolchain-stable module can demonstrate resource or usage constraints.

## Category theory

Introduce terminology after the learner has practical experience.

Use it to unify concepts, not to replace programming practice.

---

# 18. Reading program

Create a curated reading path.

Do not overload the learner with papers.

Each selected reading should be paired with:

* prerequisite modules;
* reading questions;
* a small application;
* a reflection entry.

Possible topics:

* monadic parsing;
* applicative programming;
* pretty printing;
* recursion schemes;
* functional data structures;
* STM;
* structured concurrency;
* lenses;
* streaming;
* typed interpreters;
* finally tagless design;
* GADTs;
* type inference;
* compiler IR;
* protocol design.

The learner is not required to understand every proof.

The purpose is to learn how advanced Haskell ideas are expressed and justified.

---

# 19. Progress tracking

Maintain learner-specific progress files.

## `progress/learner-profile.md`

Track demonstrated abilities, not personal traits.

Examples:

* comfortable with structural recursion;
* struggles with strictness;
* tends to overuse lists;
* needs more graph-invariant practice;
* strong at property testing;
* weak at error-model design.

## `progress/journal.md`

The learner records:

* design choices;
* failed approaches;
* discovered counterexamples;
* performance findings;
* concepts learned;
* remaining doubts.

## `progress/weaknesses.md`

Track recurring technical weaknesses.

Each weakness should schedule a future reinforcement module.

## `progress/review-schedule.md`

Use spaced revisit points.

Example:

* revisit after 2 modules;
* revisit after 8 modules;
* revisit in a boss fight;
* revisit after the related abstraction is introduced.

Do not advance only by calendar or module count.

Progression should depend on demonstrated competency.

---

# 20. Assessment reports

Generate structured reports for substantial modules.

Example:

```text
Module: M024 Dependency Graphs

Correctness: 92%
Property compliance: 100%
Edge cases: 86%
Totality: Pass
Mutation score: 81%
Complexity: Pass
Allocation behavior: Needs improvement
API design: Strong
Extensibility: Moderate
Explanation: Strong

Observed strengths:
- Correct SCC handling.
- Deterministic output.
- Clear separation of graph construction and traversal.

Observed weaknesses:
- Recomputes adjacency normalization.
- Retains more intermediate state than required.
- Tests do not distinguish duplicate edges from duplicate nodes.

Required before Gold:
- Remove repeated normalization.
- Add a property for edge-order independence.
- Explain memory behavior on a dense graph.
```

Do not reduce assessment to a single score.

Prefer actionable evidence.

---

# 21. Tooling expectations

Use a practical Haskell toolchain.

Likely tools include:

* GHC;
* Cabal;
* Hspec, Tasty, QuickCheck, or Hedgehog;
* Criterion or another suitable benchmark framework;
* HLint;
* Fourmolu or Ormolu;
* GHC warnings;
* HPC only as a secondary signal;
* eventlog and RTS statistics;
* profiling builds;
* golden-test tooling where appropriate.

Choose dependencies conservatively.

The learner should understand why each tool exists.

Do not hide every operation behind a complex framework.

Provide commands such as:

```text
cabal build all
cabal test all
cabal run assessment -- M001
cabal run tutor -- review M001
cabal run tutor -- hint M001 --level 1
cabal run benchmark-module -- M001
cabal run mutation-module -- M001
```

These names are illustrative.

Design a coherent command interface.

---

# 22. Initial deliverables

Do not attempt to author the full multi-year curriculum immediately.

Create a strong foundation first.

The first implementation milestone should deliver:

1. root documentation;
2. `AGENTS.md` with tutor guardrails;
3. clear learner and author modes;
4. a Cabal workspace;
5. assessment infrastructure skeleton;
6. progress-tracking structure;
7. the first 8–12 carefully designed modules;
8. one substantial early boss fight;
9. public tests;
10. performance-test examples;
11. mutation-test examples;
12. an external hidden-test design;
13. CI that enforces warnings and test integrity;
14. a roadmap for later phases.

The first modules should establish quality, not maximize quantity.

Suggested initial modules:

* M001: algebraic data types and exhaustive pattern matching;
* M002: custom recursive list;
* M003: folds, strictness, and large inputs;
* M004: tree traversals and invariants;
* M005: `Maybe` and explicit failure;
* M006: `Either` and structured errors;
* M007: `Semigroup` and `Monoid`;
* M008: property-based testing;
* M009: maps, sets, and domain newtypes;
* M010: graph reachability and cycles;
* B001: expression language with parsing, evaluation, pretty printing, and diagnostics.

These modules must not be trivial.

Even M002 should eventually include:

* correctness;
* laws;
* large-input behavior;
* linear reverse;
* stack considerations;
* productivity questions;
* a later revisit using abstractions.

---

# 23. Anti-dilution requirements

Do not weaken this project during implementation.

Specifically, do not reinterpret:

* “trial by fire” as merely adding more unit tests;
* “performance” as one loose timeout;
* “advanced Haskell” as a glossary chapter;
* “boss fights” as larger toy exercises;
* “hidden tests” as undocumented gotchas;
* “architecture review” as subjective formatting feedback;
* “explanation” as asking the learner to paraphrase the code;
* “Smithy support” as immediately generating a huge incomplete SDK;
* “networking” as only calling an existing HTTP client;
* “compiler fundamentals” as only writing a calculator parser;
* “code generation” as string concatenation without an IR;
* “resource safety” as only using `bracket` once;
* “concurrency” as starting two threads;
* “type-level programming” as using extensions without domain benefit;
* “testing” as maximizing code coverage;
* “optimization” as premature micro-tuning.

Preserve the full educational objective.

Where scope must be reduced, reduce the number of modules, not their rigor.

A smaller number of excellent modules is preferable to a broad but shallow curriculum.

---

# 24. Decision principles

When designing a module, ask:

1. What engineering ability is being trained?
2. Why is this problem worth solving?
3. Which invariant matters?
4. What weak implementation is likely?
5. How will the tests expose that weakness?
6. What performance failure is plausible?
7. What architectural pressure can be introduced later?
8. Which future abstraction will this problem motivate?
9. How will the concept recur?
10. Can the learner explain the solution without reciting code?
11. Does this prepare the learner for a boss fight?
12. Does this make the learner more capable of building real systems?

Reject modules that exist only to demonstrate syntax.

---

# 25A. Rolling curriculum development

The curriculum must not be fully authored in final detail at project initialization.

The project must distinguish between:

1. long-range curriculum architecture;
2. the next learning block;
3. the active frozen module.

## Long-range curriculum architecture

The complete curriculum should be mapped at a high level.

This map should include:

* phases;
* capabilities;
* prerequisite relationships;
* concept recurrence;
* likely boss fights;
* long-term systems projects;
* Smithy and SDK milestones;
* compiler, networking, storage, concurrency, and code-generation milestones.

Later phases should not initially contain complete exercise implementations, exhaustive test suites, or fixed APIs unless they are close enough to the learner’s current position to be designed responsibly.

The long-range roadmap is directional, not a fully frozen implementation plan.

## Next learning block

Only the next four to eight modules and one cumulative challenge should normally be authored in complete detail.

A fully authored module includes:

* exact specification;
* public API;
* learner stubs;
* public tests;
* property tests;
* adversarial categories;
* complexity expectations;
* memory expectations;
* forbidden shortcuts;
* mutation plan;
* performance plan;
* reflection questions;
* assessment gates;
* private-test plan;
* future revisit plan.

The next block must be designed using evidence from:

* completed modules;
* assessment reports;
* learner journal entries;
* recurring weaknesses;
* hint history;
* performance mistakes;
* architecture mistakes;
* explanation quality;
* boss-fight outcomes.

## Active frozen module

Before the learner begins a module, its contract must be frozen.

The frozen material includes:

* specification;
* API;
* documented invariants;
* public tests;
* public properties;
* performance expectations;
* completion gates;
* permitted and prohibited techniques.

Once frozen, the module must not be weakened or redesigned merely because the learner’s implementation fails.

Corrections are permitted only for objective curriculum defects such as:

* contradictory requirements;
* incorrect expected behavior;
* nondeterministic performance checks;
* platform incompatibility;
* a test that violates the documented contract;
* missing coverage of an already documented invariant.

Every correction must be recorded in a module change log.

“Learner implementation failed” is not a sufficient reason to change a test or requirement.

## Governing principle

> The standards remain fixed; the route to meeting them adapts.

Adaptation may change:

* module order;
* reinforcement frequency;
* prerequisite drills;
* hint structure;
* future problem selection;
* timing of boss fights;
* concept revisit frequency.

Adaptation must not remove essential capabilities merely because the learner struggles with them.

A weakness should result in better-targeted pressure, not lower standards.

---

# 25B. Module authoring and review lifecycle

Every detailed learning block must pass through the following lifecycle.

## Step 1: Evidence review

Before proposing the next block, inspect:

* `progress/learner-profile.md`;
* `progress/weaknesses.md`;
* `progress/journal.md`;
* `progress/review-schedule.md`;
* recent assessment reports;
* recent benchmark reports;
* recent hint requests;
* recent boss-fight reports.

Do not infer learner ability only from whether tests passed.

## Step 2: Block proposal

Propose four to eight modules and one cumulative challenge.

For each module, state:

* engineering capability being trained;
* prerequisites;
* likely weak implementation;
* key invariants;
* important edge classes;
* performance risks;
* memory risks;
* future abstraction it may motivate;
* future contexts where the concept will recur.

Do not implement modules during the proposal step.

## Step 3: Independent review passes

Review the block from several roles.

### Specification reviewer

Checks:

* clarity;
* fairness;
* complete contract;
* absence of hidden requirements;
* consistency between prose and types.

### Property-testing reviewer

Checks:

* relevant laws;
* round-trip properties;
* invariant-preservation properties;
* generator quality;
* shrinking quality;
* whether tests overfit examples.

### Adversarial reviewer

Checks:

* empty inputs;
* singleton inputs;
* extreme nesting;
* cycles;
* malformed values;
* duplicates;
* unusual Unicode;
* large inputs;
* partial reads;
* cancellation;
* exception paths;
* race conditions where applicable.

### Performance reviewer

Checks:

* whether tests distinguish complexity classes;
* whether thresholds are stable;
* whether allocation is measured where relevant;
* whether a superficially fast but asymptotically weak solution can pass;
* whether a benchmark measures the intended operation.

### Haskell semantics reviewer

Checks:

* totality;
* strictness;
* laziness;
* productivity;
* retained references;
* stack safety;
* typeclass laws;
* unsafe shortcuts.

### Pedagogy reviewer

Checks:

* solution leakage;
* abstractions introduced before motivation;
* excessive scaffolding;
* accidental trivialization;
* whether the problem teaches an engineering capability rather than syntax.

## Step 4: Revision

Revise the proposed block based on the independent reviews.

Do not proceed merely because files already exist.

## Step 5: Implementation

Create:

* specifications;
* stubs;
* public tests;
* assessment metadata;
* test plans;
* performance plans;
* mutation plans;
* revisit plans.

Do not create learner solutions in the learner-visible repository.

## Step 6: Pre-attempt audit

Before a learner begins a module, compare every documented invariant and edge category with:

* public test coverage;
* property coverage;
* private planned coverage;
* mutation coverage;
* performance coverage;
* memory coverage where relevant.

Repair gaps before freezing the module.

## Step 7: Freeze

Record:

```text
MODULE_STATUS: FROZEN_FOR_ATTEMPT
MODULE_VERSION: <version>
FROZEN_AT: <date or commit>
```

After freezing, learner-tutor sessions may inspect and assess but must not redesign the module.

## Step 8: Post-module adaptation

After assessment:

* update learner profile;
* record weaknesses;
* schedule revisits;
* identify concepts that did not transfer;
* modify future modules;
* do not retroactively lower the completed module’s standards.

## Step 9: Post-boss review

After each boss fight, conduct a broader review:

* Which fundamentals transferred under integration pressure?
* Which abstractions were used appropriately?
* Which abstractions were used ceremonially?
* What failed only at scale?
* What failed only under concurrency, malformed input, or resource pressure?
* Which earlier modules need revisiting?
* Is the next phase properly timed?
* Does the roadmap require reordering?

---

# 25C. Test-plan artifacts

Every substantial module must include separate planning documents.

Recommended files:

```text
README.md
DESIGN.md
PUBLIC_TEST_PLAN.md
PRIVATE_TEST_PLAN.md
MUTATION_PLAN.md
PERFORMANCE_PLAN.md
REVISIT_PLAN.md
CHANGELOG.md
```

The purpose of these plans is to preserve assessment intent even when concrete test code accidentally omits a case.

## `PUBLIC_TEST_PLAN.md`

Describes:

* visible examples;
* visible properties;
* contract demonstrations;
* tests intended to teach the learner how to interpret the API.

## `PRIVATE_TEST_PLAN.md`

Describes categories rather than secret implementations.

It must map every private category to a documented requirement.

## `MUTATION_PLAN.md`

Lists plausible implementation defects that a strong test suite should detect.

Mutants should model realistic errors, not meaningless syntactic changes.

## `PERFORMANCE_PLAN.md`

Describes:

* required complexity class;
* input-size progression;
* allocation expectations;
* residency expectations;
* stability considerations;
* intentionally poor baselines;
* why the measurement is meaningful.

## `REVISIT_PLAN.md`

Records:

* when the module returns;
* which later abstraction motivates the revisit;
* what stricter requirement will be introduced;
* which boss fight consumes the capability.

---

# 25D. Prompt library

Create a repository-level `prompts/` directory.

Reusable Codex instructions must be stored as prompt files rather than repeatedly reconstructed from memory.

The prompt library should be divided into:

* learner prompts;
* curriculum-author prompts;
* review prompts;
* maintenance prompts.

`AGENTS.md` remains authoritative over all prompt files.

A prompt file may request a mode, but it cannot override tutor restrictions or repository governance.

The prompt library must include instructions for:

* starting a learner session;
* reviewing learner work without editing it;
* requesting graded hints;
* requesting counterexamples;
* performance review;
* oral examination;
* final module assessment;
* designing the next block;
* hostile curriculum review;
* test-plan audit;
* adversarial review;
* performance-test review;
* implementing an approved block;
* post-boss curriculum review;
* repairing an objectively defective module;
* updating learner progress.

Each prompt file should be usable through a command such as:

```text
Read prompts/learner/start-session.md and follow it.
```

---

# 26. Revised initial deliverables

Do not fully implement the entire multi-year curriculum.

Initial project construction should produce:

1. complete governing documentation;
2. the high-level curriculum map;
3. the concept dependency graph;
4. the concept recurrence map;
5. the boss-fight roadmap;
6. learner and curriculum-author operating modes;
7. assessment infrastructure;
8. prompt library;
9. module and test-plan templates;
10. progress tracking;
11. the first four to eight polished modules;
12. the first polished boss fight;
13. public/private evaluation separation;
14. review and module-freezing workflows;
15. CI checks for warning flags and test integrity.

Later blocks must be authored shortly before use and adapted using evidence from the learner’s demonstrated performance.

Breadth may be planned early.

Detailed tests, stubs, APIs, and assessment mechanics must be produced incrementally and reviewed before the learner reaches them.


# Immediate task for Codex CLI

Inspect the current repository and read this document in full.

Do not fully implement the entire curriculum.

First produce and document:

1. the proposed repository architecture;
2. the complete root `AGENTS.md`;
3. the permanent governance documents;
4. the high-level curriculum roadmap;
5. the phase dependency map;
6. the concept recurrence map;
7. the boss-fight roadmap;
8. learner-tutor and curriculum-author mode boundaries;
9. assessment infrastructure design;
10. public/private test separation;
11. module-freezing and change-control rules;
12. progress and adaptation model;
13. prompt-library structure;
14. module and test-plan templates;
15. first-block proposal.

Then fully author only the first learning block:

* four to eight modules;
* one substantial boss fight;
* public tests;
* property tests;
* test plans;
* mutation plans;
* performance plans;
* revisit plans;
* assessment metadata.

Before implementing that block, run and document:

* specification review;
* property-testing review;
* adversarial review;
* performance review;
* Haskell semantics review;
* pedagogy and solution-leakage review.

Do not create learner solutions.

Do not put private reference solutions or genuinely hidden tests in the learner-visible repository.

Do not freeze a module until its documented invariants and edge categories have been audited against its planned assessment coverage.

The system must preserve this principle:

> Plan broadly, author deeply just before use, freeze the active trial, and adapt future pressure using evidence from the learner.
