# Design Notes — B001

LEARNER_OWNED: yes

Answer in your own words without implementation code. Complete the component questions before coding and the cross-cutting change question before assessment.

## Before code

### DQ-1 — Component boundaries
- Stage: `BEFORE CODE`
- Scope: Syntax, Parser, Eval, Pretty
- Maps to: FR-1..8, INV-1..5; Gate 0, MR
- Answer shape: ownership table for lexical, AST, scope, diagnostic, and formatting invariants

Which module owns each invariant, and which dependencies may cross component boundaries?

Your answer:

### DQ-2 — Parser state and progress
- Stage: `BEFORE CODE`
- Scope: Parser
- Maps to: FR-2, FR-3, INV-1, INV-2; Gate 0, PT, OR
- Answer shape: state fields plus a progress argument for every successful branch; no parser recipe

What parser state is required, and how does each successful branch prove it consumed input or completed?

Your answer:

### DQ-3 — Precedence and associativity
- Stage: `BEFORE CODE`
- Scope: Parser and AST
- Maps to: grammar, FR-2, INV-4; Gate 0, PP
- Answer shape: AST shapes for representative additive, multiplicative, and unary chains

How must left associativity and precedence be represented structurally in the AST?

Your answer:

### DQ-4 — Parse-error contract
- Stage: `BEFORE CODE`
- Scope: Parser diagnostics
- Maps to: FR-2, FR-3, INV-5; Gate 0, PT
- Answer shape: table for ordinary character, end-of-input, and trailing garbage

What must offset, found value, and expected categories mean at each failure boundary?

Your answer:

### DQ-5 — Evaluation and shadowing
- Stage: `BEFORE CODE`
- Scope: Eval
- Maps to: FR-4..6, INV-3; Gate 0, PT
- Answer shape: one nested let/division trace including environment and error demand

How do lexical shadowing, first-match lookup, and left-to-right error demand appear in an evaluation trace?

Your answer:

### DQ-6 — Semantic printing
- Stage: `BEFORE CODE`
- Scope: Pretty and Parser
- Maps to: FR-7, FR-8, INV-4; Gate 0, PP
- Answer shape: parenthesization decision stated by context plus counterexamples to naive rendering

When are parentheses semantically required to preserve the exact AST?

Your answer:

### DQ-7 — Resource risks
- Stage: `BEFORE CODE`
- Scope: Parser, Eval, Pretty
- Maps to: complexity/memory/stack contract; Gate 0, PF, MM
- Answer shape: table of component, input measure, dominant operation, quadratic/backtracking risk, and demanded result

Which operation and input shape control time, allocation, and stack behavior in each component?

Your answer:

### DQ-8 — Valid AST evidence
- Stage: `BEFORE CODE`
- Scope: Syntax/Parser/Pretty properties
- Maps to: FR-1, FR-8, INV-1, INV-4; Gate 0, PP, MU
- Answer shape: generator invariant, shrink invariant, edge classes, and mutant categories

How will valid AST generation and shrinking preserve the domain while discriminating parser/printer faults?

Your answer:

## Before assessment

### DQ-9 — Source-span architecture change
- Stage: `BEFORE ASSESSMENT`
- Scope: Syntax, Parser, diagnostics, Eval
- Maps to: Gate 10 source-spans change; OR, MR
- Answer shape: invariant owner, changed types/boundaries, localization argument, and unaffected semantics

How could source spans be attached without polluting evaluation semantics or entangling component ownership?

Your answer:
