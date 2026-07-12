# Performance and Memory Plan — M005

Use visit-instrumented private equivalents and n/2n/4n lists with head/middle/end/missing positions. Required upper bound is one pass per relevant collection and early stop. Measure input construction separately; allocation should scale linearly without sorting/conversion. A broad hang guard is secondary. Deliberately weak baseline repeats findUser or scans all teams before proving the user exists.
