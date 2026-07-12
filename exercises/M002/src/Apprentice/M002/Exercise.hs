module Apprentice.M002.Exercise
  ( List (..)
  , fromList
  , toList
  , append
  , mapList
  , lengthList
  , reverseList
  , takeList
  , repeatList
  ) where

data List a = Nil | Cons a (List a)
  deriving (Eq, Show)

fromList :: [a] -> List a
fromList = error "TODO M002: learner implements fromList"

toList :: List a -> [a]
toList = error "TODO M002: learner implements toList"

append :: List a -> List a -> List a
append = error "TODO M002: learner implements append"

mapList :: (a -> b) -> List a -> List b
mapList = error "TODO M002: learner implements mapList"

lengthList :: List a -> Int
lengthList = error "TODO M002: learner implements lengthList"

reverseList :: List a -> List a
reverseList = error "TODO M002: learner implements reverseList"

takeList :: Int -> List a -> List a
takeList = error "TODO M002: learner implements takeList"

repeatList :: a -> List a
repeatList = error "TODO M002: learner implements repeatList"
