# M001 — Total Domain Transitions

MODULE_STATUS: RETIRED
MODULE_VERSION: 1.0
FROZEN_AT: 2026-07-12
COMPLETED_AT: 2026-07-12

## Purpose

Learn to model a closed domain with algebraic data types and implement total, exhaustive transitions without wildcard cases that erase domain meaning.

## Prerequisites

Toolchain orientation: build a Cabal package, read a type signature, and interpret compiler diagnostics.

## Engineering capability

Turn a written state-machine contract into exhaustive code whose invalid transitions are explicit data and whose trace processing preserves the first failure with location.

## Public API

Module Apprentice.M001.Exercise exports Phase, Command, TransitionError, step, and runCommands. Constructors are public because exhaustive matching is the pressure of this module. Do not change the API.

## Functional requirements

- FR-1: Submit changes Draft to Submitted.
- FR-2: Approve and Reject change Submitted to Approved and Rejected respectively.
- FR-3: Reopen changes Rejected to Draft.
- FR-4: every other phase/command pair returns InvalidTransition with the original values.
- FR-5: runCommands applies commands left-to-right and returns the first failure as a zero-based command index plus its structural error.
- FR-6: an empty command list returns the initial phase.

## Invariants

- INV-1: Approved is terminal; no command changes it.
- INV-2: an invalid transition never fabricates a different phase or command in its error.
- INV-3: commands after the first failure are not semantically applied.
- INV-4: results are total for every value constructible from the public types.

## Complexity requirements

PERF-1: runCommands is O(k) time for the consumed prefix of k commands and uses no repeated traversal of that prefix. It must stop at the first error. Complexity is assessed structurally and on scaling traces, not by a tight timeout.

## Memory, strictness, and stack

MEM-1: processing a long valid trace must not retain already-consumed commands unnecessarily. The private plan includes a large trace and broad stack guard. Infinite input has no completion requirement, but a failure in a finite prefix must be observable without demanding the tail.

## Forbidden shortcuts

- FS-1: no wildcard or catch-all pattern in step.
- FS-2: no partial functions, exceptions, unsafe operations, or suppression of incomplete-pattern warnings.
- FS-3: do not change the ADTs/API or encode invalid transitions as strings or sentinels.
- FS-4: do not convert the trace to another collection merely to traverse it repeatedly.

Deliberate TODO stubs are permitted only while the attempt is incomplete and must be gone at assessment.

## Public examples

~~~text
step Draft Submit == Right Submitted
step Submitted Approve == Right Approved
step Approved Reopen == Left (InvalidTransition Approved Reopen)
runCommands Draft [Submit, Reject, Reopen] == Right Draft
runCommands Draft [Approve, Submit] == Left (0, InvalidTransition Draft Approve)
~~~

## Completion gates

Gate 0 design, Gate 1 warnings-as-errors compilation, Gates 2–4 public/property/adversarial correctness, Gate 5 totality/forbidden source review, Gate 6 mutation categories, Gate 7 structural scaling, Gate 8 retention/stack review, Gate 10 changed-command discussion, and Gate 11 oral defense. Minimum progression tier: Gold.

## Reflection questions

1. Why does explicit enumeration make a future constructor safer than a wildcard?
2. Prove that runCommands reports the least failing index.
3. What input portion must be evaluated to observe a finite-prefix failure?
4. If Withdraw were added from Submitted to Draft, which parts should change and which evidence should remain stable?
5. Give a counterexample to implementing runCommands by validating every transition independently from the initial phase.

## Future revisit

M003 revisits evaluation of traces; B001 transfers exhaustive recursion to an AST; a later protocol-state module makes invalid transitions harder to represent.
