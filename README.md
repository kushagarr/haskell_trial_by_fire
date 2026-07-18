# Trial by Fire Haskell Apprenticeship

This repository is a rigorous, rolling Haskell systems-programming apprenticeship. It is not a solution bank or a sequence of syntax drills. The learner owns implementations; the repository supplies explicit contracts, public evidence, adversarial pressure, performance and memory qualification, review, and progressively limited tutoring.

Start a learner session from the repository root:

~~~text
codex "Read prompts/learner/start-session.md and follow it."
~~~

Read AGENTS.md first. It is authoritative over every prompt and workflow.

During that session, say `I'm ready for complete assessment` when the active
attempt is ready. The tutor will identify the active module and run its public
and configured private executable gates; you do not need to know a private
repository path or command.

You can also ask `What next?` at any point. The tutor will name the next
unresolved gate and explicitly tell you whether to wait, commit the assessment
candidate now, keep an assessed candidate immutable, or commit progress
evidence separately.

## Current state

- Active trial: M002
- Active status: FROZEN_FOR_ATTEMPT, version 1.0.1
- Completed: M001 Gold at commit 96c3bf8
- Fully authored learning block: M001 through M008
- Fully authored cumulative challenge: B001 Expression Language
- Later curriculum: roadmap-level only
- Hidden tests and reference solutions: external private environment only; none are stored here

## Repository map

- COURSE.md: progression and completion model
- ROADMAP.md: long-range directional curriculum
- CURRICULUM_PRINCIPLES.md: educational design rules
- ASSESSMENT.md: gates and evidence model
- CONTRIBUTING.md: safe curriculum and infrastructure changes
- exercises/: learner source, public tests, public benchmarks, and visible assessment plans
- boss-fights/: cumulative integration trials
- curriculum/: dependencies, recurrence, boss roadmap, and rolling block records
- prompts/: reusable Codex workflows subordinate to AGENTS.md
- templates/: authoring and reporting contracts
- progress/: evidence-based learner record
- docs/governance/: detailed operating procedures
- support/: small transparent commands and audits

## Common commands

~~~text
cabal build all
cabal test all
./support/bin/apprentice design-status
./support/bin/apprentice test M001
./support/bin/apprentice assess
./support/bin/apprentice bench M001
./support/bin/apprentice review M001
./support/bin/apprentice governance-audit
~~~

Public tests are expected to fail on untouched TODO stubs. A successful build shows infrastructure health; module completion requires the gates declared by that module.

`apprentice design-status` derives the sole active frozen module and reports
which staged design questions still need answers. `apprentice assess` derives
the same module and refuses to start while required design questions remain
unanswered. It also fails closed if the private assessor is unavailable or a
public/private executable gate fails. Manual-review and oral-defense gates are
completed by the learner assessment workflow around this command.

## Core principle

> The learner writes the code.
> The system supplies pressure, evidence, constraints, tests, review, and carefully limited guidance.
> Passing means demonstrating engineering competence, not merely satisfying examples.
