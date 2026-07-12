# Performance and Memory Plan — M003

Measure sumStrict over prebuilt n/2n/4n lists, force the Int, and record CPU ratios, allocated bytes, and maximum residency with identical RTS/toolchain settings. Use a broad timeout only for runaway work. Separately observe fixed-size prefixes of infinite map/take; never benchmark construction of [1..n] as if it were the fold. Weak baselines: lazy left accumulation and append-producing folds. Learner explains WHNF demand and input retention.
