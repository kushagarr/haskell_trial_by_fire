# Performance and Memory Plan — M008

Measure property predicate overhead with fixed prebuilt candidates/input sizes separately from QuickCheck generation/shrinking. Use n/2n/4n to identify accidental exponential or repeated candidate calls; permit documented O(n²) multiplicity checks at bounded sizes. Count candidate invocations where private instrumentation is available. Broad timeout catches nontermination only. Learner explains why test-harness cost must not be blamed on the SUT.
