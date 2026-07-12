# Performance and Memory Test Review

First read root AGENTS.md in full. Enter CURRICULUM_AUTHOR review mode; do not change thresholds during this review.

Read each contract and PERFORMANCE_PLAN. Verify measured operation/demand, n/2n/4n series, input construction separation, operation/model evidence, allocation/residency/stack/productivity checks, deliberately poor baselines, toolchain recording, noise tolerance, and broad timeout guard. Detect tests measuring generators, parsing fixtures, or printing instead of the target. Identify brittle constants, missing strictness checks, and superficially fast weak solutions. Report findings before repair.
