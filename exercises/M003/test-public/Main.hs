module Main (main) where

import Apprentice.M003.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "M003 public contract"
  [ testCase "strict fold empty" $ foldLeftStrict (+) (0 :: Int) [] @?= 0
  , testCase "right fold preserves parenthesization" $ foldRight (-) 0 [1, 2, 3 :: Int] @?= 2
  , testCase "nonpositive take" $ takeViaFoldRight 0 [1 ..] @?= ([] :: [Int])
  , testCase "productive take" $ takeViaFoldRight 4 [1 ..] @?= [1, 2, 3, 4 :: Int]
  , testCase "productive map prefix" $ take 4 (mapViaFoldRight (+ 1) [0 ..]) @?= [1, 2, 3, 4 :: Int]
  , QC.testProperty "strict sum agrees with Prelude finite sum" $ \xs -> sumStrict xs == sum (xs :: [Int])
  , QC.testProperty "right fold reconstructs finite list" $ \xs -> foldRight (:) [] xs == (xs :: [Int])
  , QC.testProperty "map composition" $ \xs ->
      mapViaFoldRight (+ 1) (mapViaFoldRight (* 2) xs) == mapViaFoldRight ((+ 1) . (* 2)) (xs :: [Int])
  ]
