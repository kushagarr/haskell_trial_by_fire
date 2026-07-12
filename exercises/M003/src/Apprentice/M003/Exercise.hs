module Apprentice.M003.Exercise
  ( foldLeftStrict
  , foldRight
  , sumStrict
  , mapViaFoldRight
  , takeViaFoldRight
  ) where

foldLeftStrict :: (b -> a -> b) -> b -> [a] -> b
foldLeftStrict = error "TODO M003: learner implements foldLeftStrict"

foldRight :: (a -> b -> b) -> b -> [a] -> b
foldRight = error "TODO M003: learner implements foldRight"

sumStrict :: [Int] -> Int
sumStrict = error "TODO M003: learner implements sumStrict"

mapViaFoldRight :: (a -> b) -> [a] -> [b]
mapViaFoldRight = error "TODO M003: learner implements mapViaFoldRight"

takeViaFoldRight :: Int -> [a] -> [a]
takeViaFoldRight = error "TODO M003: learner implements takeViaFoldRight"
