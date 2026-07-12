module Main (main) where

import Apprentice.M007.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "M007 public contract"
  [ testCase "identity value" $ (mempty :: Summary) @?= Summary 0 0 []
  , testCase "ordered combination" $ Summary 1 2 ["a"] <> Summary 1 3 ["b"] @?= Summary 2 5 ["a", "b"]
  , testCase "one entry" $ summarizeEntry "x" 7 @?= Summary 1 7 ["x"]
  , testCase "summarize preserves order" $ summarize [("b", 2), ("a", 3)] @?= Summary 2 5 ["b", "a"]
  , testCase "summarize preserves duplicate labels" $ summarize [("x", 1), ("x", 2)] @?= Summary 2 3 ["x", "x"]
  , QC.testProperty "associativity" $ forSummary3 $ \a b c -> (a <> b) <> c == a <> (b <> c)
  , QC.testProperty "left identity" $ forSummary $ \a -> mempty <> a == a
  , QC.testProperty "right identity" $ forSummary $ \a -> a <> mempty == a
  , QC.testProperty "summarize concatenation homomorphism" $ \xs ys ->
      summarize (xs ++ ys) == summarize xs <> summarize (ys :: [(String, Int)])
  , QC.testProperty "summarize count/labels invariant" $ \xs ->
      let result = summarize (xs :: [(String, Int)])
       in entryCount result == length (labelsInOrder result)
  , QC.testProperty "summarize total is mathematical sum" $ \xs ->
      valueTotal (summarize xs) == sum (map (fromIntegral . snd) (xs :: [(String, Int)]))
  ]

forSummary :: (Summary -> Bool) -> QC.Property
forSummary predicate = QC.forAll generator predicate

forSummary3 :: (Summary -> Summary -> Summary -> Bool) -> QC.Property
forSummary3 predicate = QC.forAll generator $ \a -> QC.forAll generator $ \b -> QC.forAll generator (predicate a b)

generator :: QC.Gen Summary
generator = Summary <$> QC.arbitrary <*> QC.arbitrary <*> QC.arbitrary
