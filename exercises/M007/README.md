# M007 — Semigroups, Monoids, and Laws

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9
FROZEN_AT: N/A

## Purpose and prerequisites

After M003 and M006, design a compositional summary whose instance has genuine domain meaning, then defend its laws and operational behavior.

## API and contract

Summary records entryCount, valueTotal, and labelsInOrder. Its Semigroup combines counts/totals additively and labels in left-to-right order. Monoid identity is zero counts/totals and no labels. summarizeEntry creates the one-entry summary; summarize combines input entries in order.

## Invariants and laws

Counts are nonnegative for values produced by the public constructors/functions; entryCount equals labels length for summarize results; valueTotal is the mathematical Integer sum; labels preserve duplicates/order. Semigroup associativity and both Monoid identities hold for all total Summary values, including manually constructed values (lawfulness may not assume the derived invariant).

## Complexity, memory, strictness

Combining summaries is proportional to the left labels representation under the fixed API. summarize must avoid a left-associated quadratic label chain and a large lazy numeric thunk chain; it is O(n + total label output). Long-chain allocation/residency is assessed. This operational pressure motivates later alternative representations rather than changing the API now.

## Forbidden shortcuts

No unlawful instance tailored to examples, sorting/deduplicating labels, partial/unsafe functions, warning suppression, manual hard-coded length after discarding entries, or using a different order than the contract.

## Gates, reflection, revisit

Gates 0–8, 10, 11; minimum Gold. State observational equality for laws, prove associativity field by field, explain why tests cannot prove a law, analyze list append association, and propose a representation change for cheap arbitrary combination. Revisit with Foldable, validation accumulation, builders/difference lists, metrics, and deterministic generation.
