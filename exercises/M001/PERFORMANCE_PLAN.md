# Performance and Memory Plan — M001

Measured operation: runCommands over valid repeating Submit/Reject/Reopen traces, forcing the Either result. Construct input outside timing.

- Scale k, 2k, 4k and expect linear work; use broad ratios across repeated samples.
- Instrumented private candidate counts step calls and requires exactly the consumed prefix.
- An early invalid first command followed by a very large tail must finish based on the prefix, demonstrating short circuit.
- Allocation growth should be linear or better and not retain the consumed head; compare RTS allocated bytes and maximum residency across scales.
- Broad time/stack limits only guard hangs/crashes and are not the complexity proof.
- Deliberately weak baseline: a repeated-index/repeated-prefix traversal implementation.

The learner must explain what demand on the result and input is included and why one duration cannot establish O(k).
