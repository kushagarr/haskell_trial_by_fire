# Design Notes — M001

LEARNER_OWNED: yes

Before implementation, answer in your own words:

1. List the complete phase/command transition table and identify terminal states.
2. Which invariant is established by step and which by runCommands?
3. How will you preserve the first failing zero-based index without a partial operation?
4. What portion of the command list must be evaluated on success and on early failure?
5. Why would a wildcard be dangerous after adding a constructor?
6. What public property would distinguish left-to-right state threading from repeated use of the initial phase?
