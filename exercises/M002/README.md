# M002 — Custom Recursive Lists

MODULE_STATUS: AUDITED_READY
MODULE_VERSION: 0.9
FROZEN_AT: N/A

## Purpose, prerequisites, capability

After M001, implement and reason about a recursive collection without borrowing Prelude list operations. Develop structural recursion, order preservation, productivity, and linear-work judgment.

## Public API

Apprentice.M002.Exercise exports List(..), fromList, toList, append, mapList, lengthList, reverseList, takeList, and repeatList. API changes are forbidden.

## Requirements and invariants

- FR-1: fromList/toList preserve order and round-trip finite values.
- FR-2: append preserves all left elements followed by all right elements.
- FR-3: mapList preserves shape/order and applies exactly one mapping per demanded element.
- FR-4: lengthList returns the finite constructor count.
- FR-5: reverseList reverses finite order in O(n), not by repeated append.
- FR-6: takeList n returns at most max 0 n elements without demanding more input than needed.
- FR-7: repeatList is an unbounded productive List.
- INV-1: append has Nil as left/right identity and is associative for finite total lists.
- INV-2: reverse is an involution and preserves length for finite total lists.
- INV-3: takeList k (repeatList x) produces a finite prefix for k >= 0.

## Complexity, memory, and strictness

fromList, toList, mapList, lengthList, and reverseList are O(n) for finite n; append is O(length left); takeList is O(min(max 0 k, available)). reverseList and lengthList must survive a private large finite input without avoidable thunk/stack failure. mapList, takeList, and repeatList must be productive under bounded observation.

## Forbidden shortcuts

No Data.List operations, Foldable methods, Prelude reverse/map/length/(++), conversion to a different collection to implement core operations, partial functions, unsafe operations, warning suppression, or completed helper copied from tests. Qualified Prelude utilities in the public test module are not permission for learner source.

## Public examples

~~~text
toList (append (fromList [1,2]) (fromList [3])) == [1,2,3]
toList (takeList 3 (repeatList 'x')) == "xxx"
toList (reverseList (fromList [1,2,3])) == [3,2,1]
~~~

## Completion gates and reflection

Gates 0–8 and 11 apply; minimum Gold. Explain why repeated append makes a tempting reverse quadratic, which functions can be productive on infinite input, the demand caused by toList, and a proof of append associativity. Future revisit: M003 folds, later Foldable, and a streaming text boss.
