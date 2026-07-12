# Public Test Plan — M002

Visible units cover empty/singleton/order, negative/zero take, reverse, and a repeated-list prefix. Properties cover conversion round trip, append laws, map composition, reverse involution/length, and take length. Infinite behavior is observed only through a finite prefix. Large calibration and exact generator distributions remain private.

| IDs | Requirements | Evidence |
|---|---|---|
| UT-1..6 | FR-1..7 | examples/boundaries |
| PP-1 | FR-1 | round trip |
| PP-2 | INV-1 | identity/associativity |
| PP-3 | FR-3 | map identity/composition |
| PP-4 | INV-2 | reverse laws |
