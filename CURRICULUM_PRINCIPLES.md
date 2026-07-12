# Curriculum Principles

## Purpose

Develop expert systems-programming judgment in Haskell through substantial, fair, evidence-rich practice. Difficulty comes from real invariants, failure modes, scale, maintenance, and explanation—not vague contracts or tricks.

## Fixed standards, adaptive route

> The standards remain fixed; the route to meeting them adapts.

Learner evidence may change order, prerequisite drills, hint pacing, revisit frequency, or boss timing. It may not remove totality, correctness, lawfulness, performance, memory, architecture, or explanation capabilities required by the roadmap.

## Abstractions earn their existence

Introduce an abstraction only after concrete pressure makes its value legible. Explicit state precedes State; direct parsers precede combinators; eager failures motivate streaming; repeated recursion motivates recursion schemes; invalid AST states motivate GADTs; repeated environment threading motivates Reader.

## Spiral and recurrence

Every important concept appears at least three times: direct implementation, later abstraction/refactor, and independent transfer. Earlier work returns with stricter scale, failure, change, or integration requirements.

## Trial by fire, fairly

Substantial work combines independent evidence: correctness, properties, adversarial edges, totality, complexity, memory, stack/productivity behavior, architecture, changed requirements, and oral defense. Hidden evaluation never supplies an undocumented requirement.

## Scope discipline

Plan the whole course broadly. Deeply author only the next four to eight modules and one boss fight. Freeze one active trial after review and audit. Later APIs and tests remain intentionally undecided until learner evidence makes responsible design possible.

## Anti-dilution

When capacity is limited, author fewer modules. Do not replace performance with a timeout, architecture with style, testing with coverage, systems work with library calls, compiler work with a calculator, concurrency with thread creation, or advanced types with ceremonial extensions.
