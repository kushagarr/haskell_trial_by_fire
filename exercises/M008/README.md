# M008 — Properties That Kill Plausible Bugs

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9.1
FROZEN_AT: N/A

## Purpose and prerequisites

After M001–M007, write reusable semantic properties and show that they accept sound candidates while rejecting realistic mutants. Testing quality is discriminating evidence, not line coverage or self-comparison.

## Public API and requirements

The learner implements property predicates in Apprentice.M008.Exercise:

- reverseInvolution accepts a candidate and checks applying it twice restores input.
- reverseAppendLaw checks candidate reversal over concatenation with the mathematically required side order.
- sortIdempotent checks applying a sort candidate twice is observationally unchanged.
- sortOrdered checks adjacent output values are nondecreasing without using a sorting oracle.
- sortPermutation checks multiplicity preservation, including duplicates, using a supplied element counter helper contract.

Properties must be total for finite generated Int lists, accept the sound candidates used publicly, and kill the documented mutant classes. They must not call the property under test recursively, reproduce a complete sorting algorithm, or merely compare candidate output with itself.

## Edge/generator and performance requirements

Evidence must include empty, singleton, duplicates, already/reverse sorted, negative/boundary values, and nontrivial concatenations. Private generators ensure these classes recur and shrink. Property work is O(n²) at worst for the fixed multiplicity check and must terminate at configured sizes; generator and shrink time are measured separately from candidates.

## Forbidden shortcuts and gates

No hard-coded samples inside a supposedly universal property, tautologies, only-example evidence, calling Data.List.sort as the sort property oracle, partial/unsafe functions, disabled shrinking, warning/test weakening, or API changes. Gates 0–7, 11, plus a test-defense round; minimum Gold.

## Reflection and revisit

Explain why passing tests cannot prove a universal law, how a property can share the SUT bug, how generator distribution/shrinking affect evidence, and why mutation score alone misleads. Every later block revisits property design; later systems add model/state-machine/concurrency properties.
