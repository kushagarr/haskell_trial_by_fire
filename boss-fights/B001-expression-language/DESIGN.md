# Design Notes — B001

LEARNER_OWNED: yes

Before implementation answer:

1. Draw component boundaries and state which module owns lexical, AST, scope, and formatting invariants.
2. Describe parser state and how each successful branch proves progress without giving code.
3. State how left associativity and precedence appear in the AST.
4. Define ParseError offset/found behavior at end-of-input and trailing garbage.
5. Trace evaluation/shadowing and error demand for one nested let/division example.
6. Define a printer parenthesization decision in semantic terms and list counterexamples to naive rendering.
7. State complexity/allocation risks and how benchmark inputs isolate them.
8. Design valid AST generation/shrinking and mutant categories.
9. Sketch an architecture change for source spans without implementing it.
