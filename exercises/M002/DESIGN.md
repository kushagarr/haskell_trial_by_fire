# Design Notes — M002

LEARNER_OWNED: yes

Answer each question in your own words without implementation code. Questions marked `BEFORE CODE` establish the plan. Because the earlier M002 workflow allowed implementation to begin before enforcing this stage, complete these now as explicitly post-implementation reconstruction and pause further code changes until they are answered; do not delete working code or imply that these answers predated it. This timing limitation is a curriculum defect, not learner failure, and the reasoning will be confirmed orally. Questions marked `BEFORE ASSESSMENT` prepare Gate 0 and oral evidence.

## Before code

### DQ-1 — Finite conversions

- Stage: `BEFORE CODE`
- Scope: `fromList`, `toList`
- Maps to: FR-1; Gate 0
- Answer shape: for each function, name its base case, recursive case, and order-preservation obligation

What structural cases must each conversion handle, and what must remain true about element order after the recursive step?

Your answer:
toList
base case -> Nil as input, [] as output
recursive case -> take one element at a time, (:) it to the rest of the list generated from the function recursively till it reaches base case

fromList
base case -> [] as input, Nil as output
recursive case -> take one element at a time by pattern matching, Cons it to the rest of the generated list from the function recursively till it reaches base case

For both of the functions above, the lists are traversed in order and the output list also preserves the said order

### DQ-2 — Append and map structure

- Stage: `BEFORE CODE`
- Scope: `append`, `mapList`
- Maps to: FR-2, FR-3; Gate 0
- Answer shape: two short case analyses; no code

For each function, which input controls recursion, and what result-shape/order fact must its recursive case preserve?

Your answer:
for append: first input, as we traverse only that and the second input is just attached to it at the end of the first input.
it preserves the same input order of the first two inputs to the function in the output.
for mapList: second input, as the first input is a mapping function mapping a to b
it preserves the same input order in the output as well and also each element in that input is applied the mapping function once.
result shape is same as of the second input to the function

### DQ-3 — Finite measurements and reversal

- Stage: `BEFORE CODE`
- Scope: `lengthList`, `reverseList`
- Maps to: FR-4, FR-5, INV-2; Gate 0
- Answer shape: base/recursive cases plus one sentence distinguishing returned value from traversal work

What are the structural cases for these finite-list operations, and what correctness fact must be preserved as input is consumed?

Your answer:
for lengthList:
  base case -> list is Nil, output 0
  recursive case -> Cons _ (rest of the list) -> 1 + lengthList(rest of the list)
  each Cons is counted as 1 and only once and Nil is counted as 0
for reverseList:
  base case -> when the input List is Nil, you return the accumulated reversed list
  recursive case -> Cons x (rest of the list) -> you put x in the reversed list and call the function on the rest of the list till it reaches the base case and then you return the reversed list
  This consumes each element from the input only once hence O(n) time complexity.
  The first element becomes the last, the second element becomes second last.. so on and so forth..


### DQ-4 — Bounded and unbounded production

- Stage: `BEFORE CODE`
- Scope: `takeList`, `repeatList`
- Maps to: FR-6, FR-7, INV-3; Gate 0
- Answer shape: boundary cases and demanded-result explanation

Which count/input boundaries terminate `takeList`, and what must `repeatList` make observable without constructing a finite end?

Your answer:
for takeList:
  if count is 0, then Nil (empty list) is returned
  if count is whatever, but the input list is Nil, Nil is returned
  if count > 0 and not empty list then, you recursively take one constructor value at a time till you reach either of the above two conditions
  meaning either the count exhausts or the list exhausts
  for negative count, we return empty List by default without inspecting the input list.

for repeatList:
  the repeatList has to be productive meaning, one can get the next observable output without finishing the total evaluation of the repeatList.

### DQ-5 — Linear reverse invariant

- Stage: `BEFORE CODE`
- Scope: `reverseList`
- Maps to: FR-5; Gate 0, PF, MM
- Answer shape: one invariant stated before and after a processing step; no recursion recipe

What relationship between the already-processed prefix, remaining input, and partial result is sufficient to justify a linear reverse?

Your answer:
reverse(partial result) + remaining input = input
and
reverse(partial_result) = processed prefix

### DQ-6 — Domain and demand classification

- Stage: `BEFORE CODE`
- Scope: all exported functions
- Maps to: FR-1..7, INV-3; Gate 0, MM
- Answer shape: table with columns `function`, `finite input required?`, `bounded observation productive?`, and `what demand stops evaluation?`

Which functions require a finite input to produce their complete result, and which can produce useful output under bounded observation?

Your answer:
function - fromList
finite input required? - yes
bounded observation productive? - Yes
what demand stops evaluation? - when the input reaches [] or the consumer stops asking for more elements

function - toList
finite input required? - yes
bounded observation productive? - Yes
what demand stops evaluation? - when the input reaches Nil or the consumer stops asking for more elements

function - append
finite input required? - yes, in both first and second input
bounded observation productive? - Yes
what demand stops evaluation? - when the first input reaches Nil or the consumer stops asking for more elements

function - mapList
finite input required? - yes
bounded observation productive? - Yes
what demand stops evaluation? - when the second input reaches Nil or the consumer stops asking for more elements

function - lengthList
finite input required? - yes
bounded observation productive? - No
what demand stops evaluation? - when the input reaches Nil

function - reverseList
finite input required? - yes
bounded observation productive? - No
what demand stops evaluation? - when the input reaches Nil

function - takeList
finite input required? - No, not always..i could take 2 elements from an infinite list and it is complete
bounded observation productive? - Yes
what demand stops evaluation? - when the count reaches 0 or is less than or equal to zero or input list reaches Nil or when the consumers stops asking for more elements

function - repeatList
finite input required? - No
bounded observation productive? - Yes
what demand stops evaluation? - when the consumer stops asking for more elements

### DQ-7 — Time and space expectations

- Stage: `BEFORE CODE`
- Scope: all exported functions
- Maps to: FR-1..7 and the README complexity contract; Gate 0, PF, MM
- Answer shape: table with columns `function`, `input measure`, `time class`, `live-state/output expectation`, and `dominant operation`

What time and space behavior should each function have under the demand stated in the contract?

Your answer:
function - fromList
input measure - n
time class - O(n)
live-state/output expectation -
  Output space: it grows linearly to the order of consumed input
  Extra working state: there is no extra working memory other than the single constructor and its value, this does not grow linearly. its a constant
dominant operation - Inspecting one constructor

function - toList
input measure - n
time class - O(n)
live-state/output expectation -
  Output space: it grows linearly to the order of consumed input
  Extra working state: there is no extra working memory other than the single constructor and its value, this does not grow linearly. its a constant
dominant operation - Inspecting one constructor

function - append
input measure - m and n
time class - O(m)
live-state/output expectation -
  Output space: it grows linearly to the order of consumed input from the first list
  Extra working state: there is no extra working memory other than the single constructor and its value, this does not grow linearly. its a constant
dominant operation - Inspecting one constructor

function - mapList
input measure - n
time class - O(n)
live-state/output expectation -
  Output space: it grows linearly to the order of consumed input from the list
  Extra working state: there is no extra working memory other than the single constructor and its value and the function using that value to reach the output value, this does not grow linearly. its a constant
dominant operation - Inspecting one constructor

function - lengthList
input measure - n
time class - O(n)
live-state/output expectation -
  Output space: It stays constant
  Extra working state: Its a constant
dominant operation - Inspecting one constructor

function - reverseList
input measure - n
time class - O(n)
live-state/output expectation -
  Output space: It grows linearly to the order of the consumed input
  Extra working state: its constant
dominant operation - Inspecting one constructor

function - takeList
input measure - number k, size n
time class - O(min(max(0, k), n))
live-state/output expectation -
  Output space: It grows linearly to the order of the consumed input
  Extra working state: that is a constant
dominant operation - Inspecting one constructor

function - repeatList
input measure - depends on the demanded output, if n is demanded, it is O(n)
time class - depends on the consumer, O(n)
live-state/output expectation -
  Output space: It grows linearly to the order of the consumed output
  Extra working state: that is a constant
dominant operation - Wrapping the value as an element of the list

### DQ-8 — Independent laws

- Stage: `BEFORE CODE`
- Scope: `fromList`/`toList`, `append`, `mapList`, `reverseList`, `takeList`/`repeatList`
- Maps to: INV-1..3; Gate 0, PP
- Answer shape: one named law per relevant group and one sentence explaining why its oracle is not the implementation itself

Which laws would provide independent public evidence without merely calling the equivalent Prelude operation?

Your answer:
  fromList/toList -
    law name: conversion round trip
    toList (fromList preludeList) = preludeList, fromList(toList customList) = customList
    when we do the roundtrip, the expected answer is the original input
    it converts one form to another and back without using any external help
  append -
    law name: left list then right list
    final list = left list + right list
    in the append, the right list comes only after the last element of the left list, if left is Nil, then Nil + right list = right list
    if right list is Nil then left list + NIl = left list
  mapList -
    law name: preserve the shape, transform the content
    let there be two functions f and g
    mapList g (mapList f list) == mapList (g . f) list
    a function applied to each element of the List once and result is recorded in the list in order of the input elements
  reverseList -
    law name: flip the list, no append
    reverseList (reverseList list) == list
    if you reverse the list twice, you should get the same list
    and also it should happen in linear time
  takeList/repeatList -
    law name: take only what you can, don't bother looking at the rest of it
    for n >= 0 , lengthList (takeList n (repeatList x)) == n
    for n < 0, its always an empty List hence the length of it is 0



## Before assessment

### DQ-9 — Quadratic reversal counterexample

- Stage: `BEFORE ASSESSMENT`
- Scope: `reverseList`
- Maps to: FR-5; Gate 0, PF, OR
- Answer shape: causal explanation using input growth and repeated work

Why is repeated append a tempting reverse design, and why does it become quadratic as the list grows?

Your answer:
because its simple to reason about, you take the first element put it at the back of the yet to be reversed list.
So if you have a list of size n,
you would have to append n-1 times at the back to get the reversed list
and each append makes you traverse the entirety of the first list...

so as the input grows.. the traversal is to the order of n and also n-1 times, making it quadratic

### DQ-10 — Productivity under infinite input

- Stage: `BEFORE ASSESSMENT`
- Scope: `mapList`, `takeList`, `repeatList`, and observations through `toList`
- Maps to: FR-3, FR-6, FR-7, INV-3; Gate 0, PT-4, PT-5, OR
- Answer shape: classify each operation and give the demanded prefix that makes the claim meaningful

Which operations can participate productively with infinite input, and what bounded observation is required for each claim?

Your answer:
  mapList - yes, toList can get back the list only if taken to a certain finite number, else no
  takeList - yes, works well with unbounded input for a bounded demand
  repeatList - not applicable as a consumer of infinite input
               yes, for a finite demand as an unbounded producer

### DQ-11 — Demand caused by conversion

- Stage: `BEFORE ASSESSMENT`
- Scope: `toList`
- Maps to: FR-1 and the productivity contract; Gate 0, MM, OR
- Answer shape: compare observing a finite prefix with demanding the complete result

What input does `toList` demand when only a prefix of its result is observed, and what changes when the entire result is demanded?

Your answer:
if only a prefix is demanded, toList could work with an infinite input as well
as the remaining input is not demanded.
for k demanded, only the first k input constructors looked at, rest untouched.
but if the entire result is demanded, then the input has to be finite for it to return result

### DQ-12 — Append associativity argument

- Stage: `BEFORE ASSESSMENT`
- Scope: `append`
- Maps to: INV-1; Gate 0, PP-3, OR
- Answer shape: structural proof sketch naming base case, induction assumption, and recursive step

Why is append associative for finite total lists?

Your answer:
append (append xs ys) zs == append xs (append ys zs)
if i take the first list as an induction base case
if xs is Nil then -- base case
append (append Nil ys) zs = append ys zs
append Nil (append ys zs) = append ys zs
If xs is say Cons x xs' then -- assuming associativity holds for xs'
append (append (Cons x xs') ys) zs = Cons x (append (append xs' ys) zs)
which would then recurse to all elements of xs followed by (append ys zs)
otherway
append (Cons x xs') (append ys zs) = Cons x (append xs' (append ys zs))
which would then again recurse to one Constructor at a time
to all the elements of xs followed by (append ys zs)

in both the cases the x is placed in the correct order and hence at the same place as with xs' it was associative

So this way it is associative
