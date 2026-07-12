# Private Test Category Plan — M001

Concrete tests remain in external private CI.

| Category | Requirement mapping | Feedback category |
|---|---|---|
| PT-1 complete transition matrix | FR-1..4, INV-1/2/4 | incorrect or missing phase/command transition |
| PT-2 failure at each trace position | FR-5, INV-3 | wrong first-failure index or post-failure behavior |
| PT-3 long valid/reject-reopen traces | PERF-1, MEM-1 | scaling, stack, or retention class violated |
| PT-4 finite failure before undefined/unbounded tail observation | MEM-1 | demands input beyond first failure |
| PT-5 source/API integrity | FS-1..4 | forbidden wildcard/partial/API change |

All categories map to the visible contract. Feedback reports category only, never exact trace or source.
