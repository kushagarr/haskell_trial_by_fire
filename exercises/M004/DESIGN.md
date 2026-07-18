# Design Notes — M004

LEARNER_OWNED: yes

Answer in your own words without implementation code.

## Before code

### DQ-1 — Constructor coverage
- Stage: `BEFORE CODE`
- Scope: every exported tree operation
- Maps to: API contract, INV-5; Gate 0
- Answer shape: table of function, `Empty` obligation, and `Node` obligation

What must each constructor case establish for every exported operation?

Your answer:

### DQ-2 — Input measures
- Stage: `BEFORE CODE`
- Scope: complexity and stack claims
- Maps to: complexity contract; Gate 0, PF, MM
- Answer shape: definitions of `n` and `h` plus balanced/skewed relationship

What do `n` and `h` measure, and how can equal `n` produce different recursion depth?

Your answer:

### DQ-3 — Traversal construction
- Stage: `BEFORE CODE`
- Scope: `inorder`, `preorder`
- Maps to: traversal contract, INV-1; Gate 0, PF
- Answer shape: order invariant and dominant-operation analysis without a recursion recipe

What order must a partial traversal preserve, and which repeated list operation would make construction quadratic?

Your answer:

### DQ-4 — Shape preservation
- Stage: `BEFORE CODE`
- Scope: `mapTree`, `mirror`
- Maps to: INV-2..4; Gate 0, PP
- Answer shape: two structural properties and their domain assumptions

Which properties separately check mapped values, exact shape, and recursive child swapping?

Your answer:

## Before assessment

### DQ-5 — Balanced versus skewed stack
- Stage: `BEFORE ASSESSMENT`
- Scope: all recursive operations
- Maps to: complexity/stack contract; MM, OR
- Answer shape: compare work and maximum control-stack depth

Why can two O(n) traversals have materially different stack behavior on balanced and skewed trees?

Your answer:

### DQ-6 — Mirror proof
- Stage: `BEFORE ASSESSMENT`
- Scope: `mirror`
- Maps to: INV-2, INV-3; PP, OR
- Answer shape: constructor-based proof sketch

Why does applying mirror twice restore every finite total tree while preserving size and height?

Your answer:

### DQ-7 — Cached-size ownership
- Stage: `BEFORE ASSESSMENT`
- Scope: future cached-size change
- Maps to: Gate 10 architecture change; OR, MR
- Answer shape: invariant owner, construction/update boundary, and affected evidence

If each node later stores cached size, which component owns that invariant and where must changes localize?

Your answer:
