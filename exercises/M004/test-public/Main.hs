module Main (main) where

import Apprentice.M004.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "M004 public contract"
  [ testCase "empty metrics" $ (size (Empty :: Tree Int), height Empty) @?= (0, 0)
  , testCase "singleton metrics" $ (size singleton, height singleton) @?= (1, 1)
  , testCase "inorder asymmetric" $ inorder sample @?= [1, 2, 3]
  , testCase "preorder asymmetric" $ preorder sample @?= [2, 1, 3]
  , testCase "duplicates are retained" $ inorder (Node Empty (1 :: Int) (Node Empty 1 Empty)) @?= [1, 1]
  , QC.testProperty "mirror involution" $ QC.forAll treeGen $ \tree ->
      mirror (mirror tree) == tree
  , QC.testProperty "mirror preserves metrics" $ QC.forAll treeGen $ \tree ->
      (size (mirror tree), height (mirror tree)) == (size tree, height tree)
  , QC.testProperty "map identity preserves shape" $ QC.forAll treeGen $ \tree ->
      mapTree id tree == tree
  , QC.testProperty "map composition" $ QC.forAll treeGen $ \tree ->
      mapTree (+ 1) (mapTree (* 2) tree) == mapTree ((+ 1) . (* 2)) tree
  , QC.testProperty "traversal cardinality" $ QC.forAll treeGen $ \tree ->
      length (inorder tree) == size tree && length (preorder tree) == size tree
  ]

singleton :: Tree Int
singleton = Node Empty 7 Empty

sample :: Tree Int
sample = Node (Node Empty 1 Empty) 2 (Node Empty 3 Empty)

treeGen :: QC.Gen (Tree Int)
treeGen = QC.sized generate
  where
    generate 0 = pure Empty
    generate n = QC.oneof [pure Empty, Node <$> generate (div n 2) <*> QC.arbitrary <*> generate (div n 2)]
