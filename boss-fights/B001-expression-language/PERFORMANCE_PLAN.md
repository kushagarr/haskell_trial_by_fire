# Performance and Memory Plan — B001

## Operations and demand

Measure parseExpr on prebuilt flat chains and nested parentheses, pretty on prebuilt AST with the complete String forced, and eval with Either/Integer forced. Input construction and generator cost remain outside samples.

## Scaling and counters

Use n/2n/4n flat addition and nested cases. Expect linear-class parsing/rendering/evaluation absent big-integer cost. Private instrumented parsers count character/token progress and branch retries; render models count emitted fragments. Compare against deliberately weak repeated-append printer and retrying parser baselines.

## Resources

Record allocated bytes and maximum residency for flat and deep series, plus broad stack guards for deeply nested/left-skewed inputs. Environment lookup has a separate first/middle/missing visit-count series. Evaluate failure-demand cases separately. No single timeout certifies the boss.

## Stability and interpretation

Calibrate broad ratio/allocation bands on supported GHCs, record RTS/toolchain, and report noise. The learner must identify which operation and normal form each number measures and why flat success does not establish deep stack safety.
