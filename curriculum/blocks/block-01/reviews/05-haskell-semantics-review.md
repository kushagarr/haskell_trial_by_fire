# Haskell Semantics Review

REVIEW_STATUS: COMPLETE

Findings before implementation:

- Public APIs must compile with exhaustive warnings and not require learners to suppress Werror.
- Stub expressions may use error "TODO" during an attempt, but completion scans reject partial functions in learner production paths.
- M002 distinguishes productivity of map/take/repeat from termination of finite-only reverse/length.
- M003 must state weak-head versus normal-form demand and avoid claiming foldl' is universally stack-safe/productive.
- M004 separates recursion depth from asymptotic work; laziness can hide incomplete traversal unless tests force outputs.
- M005 does not teach Maybe as exception swallowing; only documented absence maps to Nothing.
- M006 structural error values are tested separately from presentation strings.
- M007 lawful instances must not rely on undefined values; associativity is observational over total domain values.
- M008 property functions must be total over generated inputs and use bounded recursion.
- B001 parser returns remaining-input discipline internally and rejects remaining non-whitespace publicly; evaluator covers every AST constructor; pretty printer preserves associativity with parentheses.

Extensions are kept minimal. BangPatterns appears only where strict accumulation pressure is explicit. No unsafe feature is enabled.
