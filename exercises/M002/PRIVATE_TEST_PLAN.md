# Private Test Category Plan — M002

Concrete cases remain in the external private assessor. Feedback identifies only the documented category, never exact inputs or source.

| Category | Requirement mapping | Evidence |
|---|---|---|
| PT-1 finite operation matrix | FR-1..7, INV-1/2 | Generated finite lists exercise every operation, boundary counts, order, conversion, mapping, length, reverse, take, and append pairs against an independent model. |
| PT-2 uneven append scaling | FR-2, append complexity | n/2n/4n CPU, allocation, and residency growth with the right operand fixed, plus a broad long-input stack/heap guard. |
| PT-3 reverse/length scaling | FR-4/5, INV-2, reverse/length complexity | n/2n/4n CPU, allocation, and residency growth for reverse and length, semantic order checks, and broad stack/heap guards. |
| PT-4 bounded infinite observations | FR-3/6/7, INV-3 | Large finite observations of map/take/repeat and negative-take productivity under bounded demand. |
| PT-5 bottom-sensitive demand | FR-2/3/6/7, productivity | Zero/negative take, mapped/appended heads, finite take, and repeated head observations must not demand unavailable tails or inputs. |
| PT-6 source/API integrity | totality and forbidden shortcuts | Warnings-as-errors compilation plus module-specific scans for partial/unsafe, Prelude/Data.List/Foldable, repeated-conversion, warning-suppression, and API violations; ambiguous structure receives manual review. |
