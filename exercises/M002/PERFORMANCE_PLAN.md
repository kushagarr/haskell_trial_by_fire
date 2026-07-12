# Performance and Memory Plan — M002

Measure append with fixed right and n/2n/4n left, and reverse/length at n/2n/4n. Force finite outputs completely and build inputs outside measurement. Compare operation counts where instrumented, allocated bytes, maximum residency, and broad stack guard. Observe takeList k over repeatList without forcing the tail. Deliberately weak baselines are append-based reverse and conversion-based operations. Broad timeouts only prevent hangs.
