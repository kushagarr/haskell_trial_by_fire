# Course Operation

## Progression

The apprenticeship advances by demonstrated capability, not calendar time or raw module count. A block contains four to eight substantial modules and one cumulative challenge. Only the current block is fully authored. One module at a time is frozen for attempt.

The initial block is M001–M008 followed by B001. M001 is active. Each module declares prerequisites, contract, API, invariants, resource expectations, forbidden shortcuts, gates, reflection, and revisit points.

## Module lifecycle

1. Evidence review of progress and assessments.
2. Block proposal without implementation.
3. Six independent reviews.
4. Revision record.
5. Specs, stubs, public evidence, and plans.
6. Requirement-to-assessment audit.
7. Freeze exactly one active module.
8. Assessment and progress update.
9. Post-boss transfer review and future adaptation.

The detailed lifecycle is in docs/governance/AUTHORING_LIFECYCLE.md.

## Learner workflow

1. Invoke prompts/learner/start-session.md.
2. Read the active module README, run `./support/bin/apprentice design-status`, and write each `BEFORE CODE` DESIGN answer before implementation where Gate 0 applies. The tutor must not recommend implementation while that stage is incomplete.
3. Implement only in the declared learner-owned source paths.
4. Use public examples and tests as contract evidence, not a specification substitute.
5. Request hints by level; the tutor does not edit implementation files.
6. After design/reflection and all declared public gates pass, create a scoped learner-candidate commit containing learner work but no progress, governance, private, generated, or build material.
7. Keep that candidate immutable while private, performance/manual, and oral gates run. Any learner-code change requires a new candidate and affected evidence rerun.
8. Record certification evidence against the candidate hash, then commit reports/progress and any next-module activation separately.
9. Schedule revisits.

## Certification

- Bronze: builds, public examples pass, no stubs remain.
- Silver: documented private edge categories and totality pass.
- Gold: relevant laws, complexity/memory, maintainability, and explanation pass.
- Platinum: strong mutation evidence, changed-requirement response, and professional documentation.
- Diamond: production-quality judgment across API, failure, performance, tests, and evolution.

Modules declare their minimum progression tier. A tier is a multidimensional evidence summary, never a single percentage.

## Revisit policy

Typical revisit points are two modules later, at the block boss, after the motivating abstraction, and in a later independent system. The schedule is adjusted from evidence in progress/, but the target capability remains fixed.
