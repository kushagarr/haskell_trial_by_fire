module Apprentice.M001.Exercise
  ( Phase (..)
  , Command (..)
  , TransitionError (..)
  , step
  , runCommands
  ) where

data Phase = Draft | Submitted | Approved | Rejected
  deriving (Eq, Show, Enum, Bounded)

data Command = Submit | Approve | Reject | Reopen
  deriving (Eq, Show, Enum, Bounded)

data TransitionError = InvalidTransition Phase Command
  deriving (Eq, Show)

step :: Phase -> Command -> Either TransitionError Phase
step = error "TODO M001: learner implements step"

runCommands :: Phase -> [Command] -> Either (Int, TransitionError) Phase
runCommands = error "TODO M001: learner implements runCommands"
