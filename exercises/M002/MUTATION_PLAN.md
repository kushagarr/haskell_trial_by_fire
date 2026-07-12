# Mutation Plan — M002

| Mutant | Plausible fault | Expected evidence |
|---|---|---|
| MU-1 | drop a constructor during conversion | PP-1/PT-1 |
| MU-2 | reverse the left operand while appending | UT-3/PP-2/PP-3/PT-1 |
| MU-3 | decrement take count incorrectly | PP-8/PT-1 |
| MU-4 | map only the first constructor | UT-4/PP-4/PP-5/PT-1 |
| MU-5 | reverse by append-per-element | PT-3 scaling/allocation class |
| MU-6 | force the mapped tail before producing the head | PT-5 productivity |
| MU-7 | recurse for a negative take count | UT-6/PT-4 productivity |

Private calibration requires every mutant to compile under the learner warning policy and be killed by its intended semantic or operational category. A compile-only rejection is not accepted as mutation evidence for a semantic fault.
