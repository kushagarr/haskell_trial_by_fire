# Design-Question Standard

`DESIGN.md` is a learner-owned reasoning record, not a paragraph of reminders and not an implementation recipe. Every newly generated, refreshed, or frozen module that requires Gate 0 follows this standard.

## Required question anatomy

Each question has:

- a stable ID such as `DQ-1`;
- a stage: `BEFORE CODE` or `BEFORE ASSESSMENT`;
- an explicit scope naming the function, type, component, or cross-cutting concern;
- mappings to documented requirement/invariant IDs and assessment gates;
- one primary reasoning task, phrased as a question;
- a bounded answer shape, such as a table row, trace, short argument, counterexample, or proof sketch;
- a visible `Your answer:` area.

Do not combine unrelated topics with semicolons. Repeated fields across several functions may use a table, but every row names its function and the meaning of each column. Questions must be answerable from already introduced material and must not rely on private cases.

## Staging and ordering

`BEFORE CODE` questions cover the design decisions needed to begin responsibly: cases, invariants, type/error ownership, demand boundaries, dominant operations, and test strategy. `BEFORE ASSESSMENT` questions cover explanation, causal analysis, counterexamples, proof sketches, tradeoffs, and changed-requirement reasoning.

Order questions from local contract understanding to cross-cutting engineering judgment. The learner may revise an earlier answer after implementation, but should preserve the reasoning change rather than silently replacing evidence.

The tutor runs `./support/bin/apprentice design-status` before recommending implementation, review, a candidate commit, or assessment. An unanswered `BEFORE CODE` question blocks an implementation recommendation; an unanswered `BEFORE ASSESSMENT` question blocks assessment. If implementation already exists because the curriculum or tutor previously allowed work out of sequence, the learner answers retrospectively and labels the answer as post-implementation reconstruction. Preserve the working code, record the timing limitation, and confirm the reasoning orally; never invent pre-code evidence or penalize the learner for the sequencing defect.

## Traceability

Every gating design question maps to at least one documented requirement/invariant and to `Gate 0`, `OR`, or a named `MR` path in the pre-attempt audit. Conversely, every required design/oral claim has a named DQ path. Private categories may test the documented requirement but may not introduce a design question or expected answer that is absent from public artifacts.

## Pedagogy and leakage

Questions ask for causality, invariants, demand, tradeoffs, predictions, laws, and counterexamples—not code narration. They may name relevant public types and operations, but must not provide pseudocode, recursion skeletons, exact hidden inputs, reference algorithms, or the answer inside the prompt. Answer-shape guidance limits scope without prescribing the conclusion.

## Adaptation

New modules adapt question emphasis using recorded learner evidence. A weak capability may recur in a new context; a demonstrated capability may receive a shorter transfer question. Adaptation changes route and emphasis, not documented standards or required evidence.

## Freeze check

A module cannot become `AUDITED_READY` or `FROZEN_FOR_ATTEMPT` if its design scaffold is an unstructured paragraph, lacks DQ IDs/stages/scope/mappings, contains bundled unrelated questions, leaks a solution, or has a gating question with no assessment path.
