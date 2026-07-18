# Private Assessment Boundary

## Physical topology

The learner repository contains public tests/properties/benchmarks, visible private category plans, metadata, and submission instructions. A separate access-controlled repository or private CI project contains concrete hidden tests, reference solutions, approved test hashes, private mutants, and exact resource fixtures.

The private system checks out a submitted commit as untrusted input and overlays or depends on private assessment outside that checkout. It must not copy hidden source, compiled source-containing artifacts, logs with exact inputs, or reference code back into learner-visible storage.

Recommended private layout (documentation only; do not create it here):

~~~text
private-assessment/
  modules/M001/tests/
  modules/M001/reference/
  modules/M001/mutants/
  approved-public-integrity/
  reporting/category-map.yaml
~~~

## Fairness contract

Every hidden case maps to an identifier in the visible module specification and PRIVATE_TEST_PLAN.md. Hidden tests may vary values, shapes, depth, scale, scheduling, and chunk boundaries, but cannot invent behavior.

## Feedback

Return category-level evidence such as “fails on deeply skewed input,” “violates duplicate-key invariant,” “allocation growth exceeds required class,” “resource not released on cancellation,” or “parser accepts trailing garbage.” Do not disclose source, seeds that reconstruct exact cases, reference output algorithms, or exact private fixtures.

## Learner-session bridge

`./support/bin/apprentice assess` is the stable learner-facing entry point. It derives the sole `FROZEN_FOR_ATTEMPT` identifier, runs public executable gates first, and invokes the configured assessor with this interface:

~~~text
assess ID /absolute/path/to/trial_by_fire
~~~

For local development, the command resolves either the sibling `trial_by_fire_private/bin/assess` dispatcher or the standard `/progs/haskell/trial_by_fire_private/bin/assess` devcontainer mount. A private CI or assessor-only environment sets `TBF_PRIVATE_ASSESSOR` to its execute-only bridge. An unavailable bridge, missing category, or nonzero result is NOT RUN/FAIL evidence and cannot produce certification.

The tutor may invoke the bridge and consume category-level output. It must not browse, search, open, or quote private files. The private system must treat the learner checkout as untrusted even though the invocation begins in that checkout.

For a required mutation gate, the trusted dispatcher validates its manifest and mutation-evidence record against the module ID, public/private contract version, current calibrated toolchain, exact declared-mutant set, killed status, and mapped private category. Only then may it emit one `MU-N KILLED PT-N` line per declared mutant and `MUTATION-GATE PASS`. These are calibration attestations for the assessor, not results of mutating learner code. Missing or inconsistent evidence must emit `MUTATION-GATE NOT-RUN` and return nonzero.

## Security limits

No hidden directory, dotfile, Git branch, submodule, LFS object, encrypted archive, ignored answer, package artifact, environment variable payload, or network URL with embedded credentials may be placed here. Secrecy comes from access separation, not obscurity.
