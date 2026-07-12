# Design Notes — M001

LEARNER_OWNED: yes

Before implementation, answer in your own words:

1. List the complete phase/command transition table and identify terminal states.
   phase         command      changed_phase

   Draft         Submit       Submitted
   Draft         Approve      InvalidTransition Draft Approve
   Draft         Reject       InvalidTransition Draft Reject
   Draft         Reopen       InvalidTransition Draft Reopen

   Submitted     Submit       InvalidTransition Submitted Submit
   Submitted     Approve      Approved
   Submitted     Reject       Rejected
   Submitted     Reopen       InvalidTransition Submitted Reopen

   Approved      Submit       InvalidTransition Approved Submit
   Approved      Approve      InvalidTransition Approved Approve
   Approved      Reject       InvalidTransition Approved Reject
   Approved      Reopen       InvalidTransition Approved Reopen
   
   Rejected      Submit       InvalidTransition Rejected Submit
   Rejected      Approve      InvalidTransition Rejected Approve
   Rejected      Reject       InvalidTransition Rejected Reject
   Rejected      Reopen       Draft

   Terminal state is Approved

2. Which invariant is established by step and which by runCommands?

   INV-1 and INV-2 are established by step
   INV-3 by runCommands
   INV-4 are established by both step and runCommands

3. How will you preserve the first failing zero-based index without a partial operation?

I will use a helper function which will take an accumulator as an extra input
something like 
  
  go :: Int -> Phase -> [Command] -> Either (Int, TransitionError) Phase
  and through the recursive run this accumulator.. bumping it up every time i start to consume the next command in the commands list..
   
First time go will be called with accumulator value being 0
both the cases of empty list and non empty list is taken care of 
whenever the TransitionError occurs..Left is returned so that no further commands are consumed

4. What portion of the command list must be evaluated on success and on early failure?
On Success -> Entire command list
On Failure -> Up till the failure command (including the failure one)

5. Why would a wildcard be dangerous after adding a constructor?
if we have a wild card handling in step function while we add another constructor to lets
  say phase.. then by default, silently it will just keep giving TransitionError
  without acknowledging the new constructor..
  When we do the exhaustive check.. then ghc will start giving warning or error depending on compilation flags..that the patterns are inexhausted..
  thats a win for the compiler.. and saves you from a silent bug waiting for runtime

6. What public property would distinguish left-to-right state threading from repeated use of the initial phase?
that state is altered with every step we take... and final state depends on all the steps we have taken
let say we start with Draft
and commands being [Submit, Reject, Reopen, Submit, Approve]
expected final result is Approved

Draft Submit is Submitted
Submitted Reject is Rejected
Rejected Reopen is Draft
Draft Submit is Submitted
Submitted Approve is Approved

if Draft was applied Reject , Reopen or Approve first.. it would have led to a
TransitionError.. only through each of those commands do we have a proper Phase at the end