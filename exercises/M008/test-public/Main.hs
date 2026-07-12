module Main (main) where

import Apprentice.M008.Exercise
import Data.List (sort)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (assertBool, testCase)
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "M008 public property quality"
  [ testCase "reverse laws accept reverse" $ assertBool "sound reverse rejected" (reverseInvolution reverse [1, 2, 3] && reverseAppendLaw reverse [1, 2] [3, 4])
  , testCase "involution kills identity reverse" $ assertBool "identity mutant survived" (not (reverseAppendLaw id [1] [2]))
  , testCase "sort laws accept sort" $ assertBool "sound sort rejected" (sortIdempotent sort [3, 1, 2] && sortOrdered sort [3, 1, 2] && sortPermutation sort [2, 1, 2])
  , testCase "ordered kills no-op sort" $ assertBool "no-op mutant survived" (not (sortOrdered id [2, 1]))
  , testCase "permutation kills duplicate-dropping sort" $ assertBool "dedup mutant survived" (not (sortPermutation dedupSort [2, 1, 2]))
  , QC.testProperty "reverse involution accepts sound candidate" $ reverseInvolution reverse
  , QC.testProperty "reverse append law accepts sound candidate" $ reverseAppendLaw reverse
  , QC.testProperty "sort idempotence accepts sound candidate" $ sortIdempotent sort
  , QC.testProperty "sort output is ordered" $ sortOrdered sort
  , QC.testProperty "sort preserves multiplicities" $ sortPermutation sort
  ]

dedupSort :: [Int] -> [Int]
dedupSort = dedup . sort

dedup :: [Int] -> [Int]
dedup [] = []
dedup (x : xs) = x : dedup (dropWhile (== x) xs)
