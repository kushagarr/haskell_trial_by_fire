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

## Security limits

No hidden directory, dotfile, Git branch, submodule, LFS object, encrypted archive, ignored answer, package artifact, environment variable payload, or network URL with embedded credentials may be placed here. Secrecy comes from access separation, not obscurity.
