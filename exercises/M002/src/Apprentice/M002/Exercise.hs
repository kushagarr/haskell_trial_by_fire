{-# LANGUAGE BangPatterns #-}
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
fromList [] = Nil
fromList (x: xs) = Cons x (fromList xs)

toList :: List a -> [a]
toList Nil = []
toList (Cons x xs) = x : toList xs

append :: List a -> List a -> List a
append Nil ys = ys
append (Cons x xs) ys = Cons x (append xs ys)

mapList :: (a -> b) -> List a -> List b
mapList _ Nil = Nil
mapList f (Cons x xs) = Cons (f x) (mapList f xs)

lengthList :: List a -> Int
lengthList xs = go 0 xs
  where
    go !acc Nil = acc
    go !acc (Cons _ ys) = go (acc + 1) ys

reverseList :: List a -> List a
reverseList xs = go Nil xs
  where
    go acc Nil = acc
    go acc (Cons y ys) = go (Cons y acc) ys

takeList :: Int -> List a -> List a
takeList n xs | n <= 0 = Nil
              | otherwise = go n xs
  where
    go 0 _ = Nil
    go _ Nil = Nil
    go !a (Cons y ys) = Cons y (go (a - 1) ys)

repeatList :: a -> List a
repeatList a = Cons a (repeatList a)