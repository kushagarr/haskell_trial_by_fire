# Specification Review

REVIEW_STATUS: COMPLETE

Findings before implementation:

1. M001 risked being a constructor-counting syntax drill. Require a state-transition domain, explicit invalid transitions, and an extensibility change question.
2. M002 needed explicit productivity boundaries and a prohibition on Prelude list conversion, not only correctness examples.
3. M003 must distinguish finite strict accumulation from productive right folds; “stack-safe” needs stated input shapes and evaluation demand.
4. M004 needed an explicit duplicate policy and clear distinction between structural validity and traversal order.
5. M005 and M006 overlapped. M005 will focus on absence/composition; M006 on stable error taxonomy and path context.
6. M007 instance laws must specify observation equality and order-sensitive summaries.
7. M008 needs an API that makes property quality assessable against named mutant categories without asking the learner to implement another algorithm.
8. B001 grammar, whitespace, precedence, associativity, integer policy, variables, and trailing-input behavior must be explicit; source spans are deferred to a changed-requirement round.

Required revisions: all eight accepted and recorded in REVISION_RECORD.md. No hidden behavioral requirements may appear only in test plans.
