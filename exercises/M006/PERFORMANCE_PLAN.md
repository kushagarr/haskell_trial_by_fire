# Performance and Memory Plan — M006

Measure invalid/valid digit scans at n/2n/4n with construction outside timing. Include very long syntactically valid out-of-range input and require bounded accumulation/early range reasoning without overflow. Record allocation and residency; path prepend is checked structurally as constant work. Weak baseline repeatedly appends digits or converts through an unbounded partial Int parse. Timeout is only a hang guard.
