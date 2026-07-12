# Mutation Plan — M001

| Mutant | Plausible fault | Expected evidence |
|---|---|---|
| MU-1 omit Reopen | constructor/transition omission | UT-1/PT-1 |
| MU-2 approve Draft | boundary state confusion | UT-2/PT-1 |
| MU-3 return altered error payload | error fabrication | UT-2/PT-1 |
| MU-4 report one-based index | index drift | UT-3/PT-2 |
| MU-5 continue after failure | ignores short-circuit invariant | PT-2/PT-4 |
| MU-6 apply each command to initial state | state threading failure | UT-3/PP-2 |

Each mutant models a realistic state-machine defect. Raw mutation percentage is not a gate.
