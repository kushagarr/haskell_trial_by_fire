# Performance and Memory Review

REVIEW_STATUS: COMPLETE

Findings before implementation:

- Separate benchmark input construction from measured operation and force results to a documented normal form.
- Use n/2n/4n series and broad ratios; do not freeze microseconds from one machine.
- Add operation-count or structural model checks where wall-clock cannot distinguish implementations reliably.
- M002 must expose quadratic append/reverse patterns and productive prefix behavior.
- M003 requires large strict accumulation plus a bounded observation of infinite input; measure allocation/residency with RTS recipes.
- M004 should distinguish O(n) traversal from repeated O(n²) subtree scans and state that deep-skew stack qualification may use private generated trees.
- M005/M006 are primarily correctness/representation modules; performance checks target duplicate traversal and quadratic path rendering rather than arbitrary speed.
- M007 checks combination growth and retained thunks for long chains.
- M008 measures generator/test harness behavior separately from the candidate operation.
- B001 checks parser and renderer scaling on flat and nested expressions, allocation growth, and broad hang guards. Timing alone cannot prove absence of exponential backtracking.

Thresholds remain in plans until calibrated in private CI across supported toolchains. Learner failure cannot justify loosening them.
