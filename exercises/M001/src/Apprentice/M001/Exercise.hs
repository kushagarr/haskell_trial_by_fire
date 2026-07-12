{-# LANGUAGE BangPatterns #-}
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
step Draft         Submit    =  Right Submitted
step Draft         Approve   =  Left (InvalidTransition Draft Approve)
step Draft         Reject    =  Left (InvalidTransition Draft Reject)
step Draft         Reopen    =  Left (InvalidTransition Draft Reopen)

step Submitted     Submit    =   Left (InvalidTransition Submitted Submit)
step Submitted     Approve   =   Right Approved
step Submitted     Reject    =   Right Rejected
step Submitted     Reopen    =   Left (InvalidTransition Submitted Reopen)

step Approved      Submit    =   Left (InvalidTransition Approved Submit)
step Approved      Approve   =   Left (InvalidTransition Approved Approve)
step Approved      Reject    =   Left (InvalidTransition Approved Reject)
step Approved      Reopen    =   Left (InvalidTransition Approved Reopen)
   
step Rejected      Submit    =   Left (InvalidTransition Rejected Submit)
step Rejected      Approve   =   Left (InvalidTransition Rejected Approve)
step Rejected      Reject    =   Left (InvalidTransition Rejected Reject)
step Rejected      Reopen    =   Right Draft

runCommands :: Phase -> [Command] -> Either (Int, TransitionError) Phase
runCommands p cs = go 0 p cs
  where 
    go !acc phase (x: xs) = case step phase x of
                            Right p'  -> go (acc+1) p' xs
                            Left err  -> Left (acc, err)
    go _ phase []  = Right phase
