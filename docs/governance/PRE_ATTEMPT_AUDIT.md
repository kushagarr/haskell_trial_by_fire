# Pre-Attempt Assessment Audit

A module is not ready to freeze until every meaningful requirement has an assessment path. Copy templates/PRE_ATTEMPT_AUDIT_TEMPLATE.md or add rows to the block audit.

## Required requirement classes

- documented behavior and examples;
- invariants and algebraic laws;
- empty/singleton/boundary/malformed/deep/large/duplicate/cyclic edges as relevant;
- complexity class and dominant operation;
- allocation, residency, strictness, stack, and productivity requirements;
- totality and failure representation;
- forbidden APIs and shortcuts;
- extensibility/change requirements;
- explanation and design claims.

## Evidence path vocabulary

PE public example; UT public unit test; PP public property; PT documented private category; MU realistic mutant; PF scaling/operation performance; MM allocation/residency/stack check; OR oral question; MR named manual review.

Every row names a requirement identifier, source clause, evidence paths, adequacy argument, and any limitation. Multiple independent paths are expected for high-risk claims. A private category cannot rescue an undocumented requirement. A timeout alone cannot establish a complexity or memory class.

## Freeze decision

The auditor records PASS only if all meaningful rows have an adequate path and public tests agree with the prose/API. Gaps return the module to implementation/revision. Findings are reported before repair during a final governance audit.
