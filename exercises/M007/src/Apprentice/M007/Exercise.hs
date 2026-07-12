module Apprentice.M007.Exercise
  ( Summary (..)
  , summarizeEntry
  , summarize
  ) where

data Summary = Summary
  { entryCount :: Int
  , valueTotal :: Integer
  , labelsInOrder :: [String]
  }
  deriving (Eq, Show)

instance Semigroup Summary where
  (<>) = error "TODO M007: learner implements Semigroup"

instance Monoid Summary where
  mempty = error "TODO M007: learner implements Monoid identity"

summarizeEntry :: String -> Int -> Summary
summarizeEntry = error "TODO M007: learner implements summarizeEntry"

summarize :: [(String, Int)] -> Summary
summarize = error "TODO M007: learner implements summarize"
