# Pedagogy and Solution-Leakage Review

REVIEW_STATUS: COMPLETE

Findings before implementation:

- Scaffolding provides types and domain vocabulary, not recursion skeletons that translate directly into answers.
- Public tests demonstrate contracts and selected laws but do not enumerate the entire private category set.
- M001 must require engineering state reasoning, not merely define an enum.
- M005 and M006 remain separate only because absence and diagnosable failure demand different design judgment.
- M008 uses supplied mutant candidates as test targets; these are intentionally faulty fixtures, not reference solutions.
- B001 is substantial but bounded: manual parsing is supported by a grammar and token policy; parser combinators, static typing, spans, and IR passes are future changes, not surprise gates.
- Reflection questions demand causality and counterexamples, not code narration.
- DESIGN.md files are learner-owned answers and begin as question scaffolds only.

Leakage check: no algorithmic pseudocode, recursion recipe, completed instance, parser implementation, evaluator, or pretty-printer algorithm may appear in module scaffolding. Plans describe failure classes and evidence, not exact secret cases or answers.
