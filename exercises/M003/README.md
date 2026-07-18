# M003 — Folds, Evaluation, and Large Inputs

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9.1
FROZEN_AT: N/A

## Purpose and prerequisites

After M002, distinguish structural folds by evaluation behavior. Engineer finite strict accumulation and productive lazy output without treating strictness as a slogan.

## Public API and requirements

Apprentice.M003.Exercise exports foldLeftStrict, foldRight, sumStrict, mapViaFoldRight, and takeViaFoldRight. Do not change types.

- FR-1: foldLeftStrict has the finite left-fold result and forces each accumulator step enough to avoid a linear thunk chain.
- FR-2: foldRight has the standard right-fold structure and may produce results without consuming an infinite tail when its combining function permits.
- FR-3: sumStrict totals finite Int input using the strict fold behavior.
- FR-4: mapViaFoldRight preserves order and is productive under bounded observation.
- FR-5: takeViaFoldRight returns at most max 0 n values and is productive on infinite input.
- LAW-1: on finite total inputs, folds agree with their mathematical parenthesization; map obeys identity/composition.

## Complexity and memory

All functions are O(consumed input). sumStrict must handle a private million-element finite list with allocation/residency consistent with constant live accumulator state plus input/result demand. take/map must not force beyond a demanded prefix. A claim of stack safety must name input shape and how the result is forced.

## Forbidden shortcuts

No Prelude/Data.List foldl, foldl', foldr, sum, map, or take in learner source; no unsafe/partial functions, warning changes, conversion structures, or strictness annotations applied without explanation.

## Examples and gates

foldLeftStrict (+) 0 [1,2,3] is 6; takeViaFoldRight 3 [1..] is [1,2,3]; taking five values from mapViaFoldRight (+1) [0..] terminates. Gates 0–8 and 11 apply, minimum Gold.

## Reflection and revisit

Explain WHNF versus full evaluation, why a strict left fold does not make every consumer constant-memory, why a right fold can be productive, and what benchmark demand is valid. Revisit in M007 aggregation, streaming, parsing, and large code-generation pipelines.
