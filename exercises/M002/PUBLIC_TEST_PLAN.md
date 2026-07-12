# Public Test Plan — M002

Visible units cover empty/singleton conversion, append/map/reverse order, negative and zero take, and a repeated-list prefix. Properties cover conversion round trip, both append identities and associativity, map identity/composition, reverse involution/length, and finite take length. Zero take is checked against a non-demandable input; broader bottom-sensitive and infinite productivity categories remain private. Large calibration and exact generator distributions remain private.

| IDs | Requirements | Evidence |
|---|---|---|
| UT-1..2 | FR-1 | empty/singleton conversion |
| UT-3..5 | FR-2/3/5 | append, map, and reverse order |
| UT-6..8 | FR-6/7, INV-3 | negative/zero take and productive repeat prefix |
| PP-1 | FR-1 | finite conversion round trip |
| PP-2 | INV-1 | left/right append identity |
| PP-3 | INV-1 | append associativity |
| PP-4 | FR-3 | map identity |
| PP-5 | FR-3 | map composition |
| PP-6 | INV-2 | reverse involution |
| PP-7 | FR-4/5, INV-2 | reverse preserves length |
| PP-8 | FR-6 | finite take length is bounded by count and input length |
