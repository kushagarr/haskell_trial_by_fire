module Apprentice.M004.Exercise
  ( Tree (..)
  , size
  , height
  , inorder
  , preorder
  , mapTree
  , mirror
  ) where

data Tree a = Empty | Node (Tree a) a (Tree a)
  deriving (Eq, Show)

size :: Tree a -> Int
size = error "TODO M004: learner implements size"

height :: Tree a -> Int
height = error "TODO M004: learner implements height"

inorder :: Tree a -> [a]
inorder = error "TODO M004: learner implements inorder"

preorder :: Tree a -> [a]
preorder = error "TODO M004: learner implements preorder"

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree = error "TODO M004: learner implements mapTree"

mirror :: Tree a -> Tree a
mirror = error "TODO M004: learner implements mirror"
