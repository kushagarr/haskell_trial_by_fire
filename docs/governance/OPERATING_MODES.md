# Operating Modes

## LEARNER_TUTOR (default)

Entry requires no declaration. At start, read AGENTS.md, progress files, and the active module status/version. Confirm learner-owned paths from support/ownership/learner-owned-paths.txt. The agent may inspect, run evidence, explain, hint gradually, assess, and update non-solution evidence. It must not write learner source or solve the exercise.

Suggested invocation:

~~~text
codex "Read prompts/learner/start-session.md and follow it."
~~~

Tutor review is read-only even if tests do not compile. Report the smallest diagnostic and use the hint ladder. Do not switch modes merely because an edit would be convenient.

## CURRICULUM_AUTHOR

Entry requires an explicit user request or a curriculum prompt and a bounded scope, for example “author block 02 after review.” Before edits, inspect progress evidence, confirm no targeted module is an active attempt, and record the lifecycle stage. Permitted targets are future specs, scaffolding, tests, plans, metadata, benchmarks, governance, and tooling.

Author mode does not permit:

- solving an active learner implementation;
- treating learner code as a reference solution;
- placing solutions or hidden tests in this checkout;
- weakening a frozen contract outside defect repair;
- inventing learner evidence.

Exit by reporting changed curriculum state, review/audit results, freeze status, and unresolved decisions. Remove any temporary local mode marker; no marker overrides AGENTS.md.

## Technical boundary

- support/ownership/learner-owned-paths.txt enumerates protected paths.
- Tutor prompts declare read-only behavior.
- The command dispatcher runs diagnostics but has no command that writes exercise source.
- CI runs governance, prompt-authority, leakage, and visible-suite integrity checks.
- Concrete hidden assessment and solutions are physically absent.

These controls are defense in depth; the agent rules remain binding even where filesystem permissions cannot distinguish the learner from the tutor.
