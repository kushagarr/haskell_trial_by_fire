# Public Test Plan — M008

Meta-tests run learner properties against sound library candidates and named faulty candidates: identity reverse, tail-dropping reverse, no-op sort, reverse sort, duplicate-dropping sort, and boundary/order faults. QuickCheck then exercises the property predicates over generated finite lists. Public tests expose representative mutants; private CI varies mutants/generators and checks properties do not pass vacuously.
