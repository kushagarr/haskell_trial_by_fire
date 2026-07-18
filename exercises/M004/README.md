# M004 — Recursive Trees, Traversals, and Invariants

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9.1
FROZEN_AT: N/A

## Purpose and prerequisites

Transfer total structural recursion from lists to branching structures after M001–M003. Preserve shape and traversal invariants while reasoning separately about total work and recursion depth.

## API and functional contract

Apprentice.M004.Exercise exports Tree(..), size, height, inorder, preorder, mapTree, and mirror. Empty has size/height 0; Node height is one plus the greater child height. Traversals visit every node exactly once in their named order. mapTree preserves exact shape. mirror swaps children recursively.

## Invariants and laws

INV-1 traversal length equals size; INV-2 mirror preserves size/height; INV-3 mirror is an involution; INV-4 map identity/composition and exact shape; INV-5 empty and singletons obey all definitions. This is a general binary tree: duplicates are allowed and no search ordering is implied.

## Complexity, memory, stack

Every exported operation is O(n) in nodes. Do not recompute size/height per node or append growing traversal prefixes quadratically. Memory is O(h) control stack plus demanded output for height h. Private qualification includes deep skew; the learner must discuss when recursion depth, not asymptotic work, is the failure mode.

## Forbidden shortcuts

No Foldable/Traversable/generic traversal library, flatten-then-rebuild implementation, partial/unsafe functions, wildcard hiding a constructor, warning suppression, or API change.

## Examples, gates, reflection

For Node (Node Empty 1 Empty) 2 Empty, inorder is [1,2], preorder [2,1], size 2, height 2. Gates 0–8, 10, 11; minimum Gold. Explain traversal order, prove mirror involution, distinguish O(n) time from O(h) stack, and propose how cached sizes would change invariants. Revisit with AST in B001, Foldable/Traversable, zippers, and compiler/model passes.
