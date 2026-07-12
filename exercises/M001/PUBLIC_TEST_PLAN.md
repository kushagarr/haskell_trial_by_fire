# Public Test Plan — M001

| Evidence | Requirements | Intent |
|---|---|---|
| UT-1 legal transitions | FR-1..3 | demonstrate state table |
| UT-2 invalid transition payload | FR-4, INV-2 | preserve exact domain values |
| UT-3 traces and index | FR-5, INV-3 | left-to-right/first failure |
| UT-4 empty and terminal | FR-6, INV-1 | boundaries |
| PP-1 empty trace identity | FR-6 | law-like base case |
| PP-2 valid trace agreement | FR-1..5 | compare short generated traces with repeated step observation |

Public tests intentionally expose representative constructors but not every private distribution or scale. They do not relax the requirement to enumerate every phase/command pair.
