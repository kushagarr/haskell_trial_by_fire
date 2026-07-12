module Main (main) where

import Apprentice.M002.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "M002 public contract"
    [ testCase "empty conversion" $ toList (fromList ([] :: [Int])) @?= []
    , testCase "singleton conversion" $ toList (fromList [7 :: Int]) @?= [7]
    , testCase "append preserves order" $
        toList (append (fromList [1, 2 :: Int]) (fromList [3, 4])) @?= [1, 2, 3, 4]
    , testCase "map preserves order" $
        toList (mapList (+ 1) (fromList [1, 2 :: Int])) @?= [2, 3]
    , testCase "reverse finite list" $
        toList (reverseList (fromList [1, 2, 3 :: Int])) @?= [3, 2, 1]
    , testCase "negative take" $ toList (takeList (-1) (repeatList 'x')) @?= []
    , testCase "zero take does not demand input" $
        takeList 0 (error "zero take demanded its input" :: List Int) @?= Nil
    , testCase "productive repeat prefix" $ toList (takeList 4 (repeatList 'x')) @?= "xxxx"
    , QC.testProperty "finite conversion round trip" $ \xs ->
        toList (fromList xs) == (xs :: [Int])
    , QC.testProperty "append identity" $ \xs ->
        let list = fromList xs :: List Int
         in append Nil list == list && append list Nil == list
    , QC.testProperty "append associativity" $ \xs ys zs ->
        append (fromList xs) (append (fromList ys) (fromList zs))
          == append (append (fromList xs) (fromList ys)) (fromList zs :: List Int)
    , QC.testProperty "map identity" $ \xs ->
        mapList id (fromList xs) == (fromList xs :: List Int)
    , QC.testProperty "map composition" $ \xs ->
        mapList (+ 1) (mapList (* 2) (fromList xs))
          == mapList ((+ 1) . (* 2)) (fromList xs :: List Int)
    , QC.testProperty "reverse involution" $ \xs ->
        reverseList (reverseList (fromList xs)) == (fromList xs :: List Int)
    , QC.testProperty "reverse preserves length" $ \xs ->
        let list = fromList xs :: List Int
         in lengthList (reverseList list) == lengthList list
    , QC.testProperty "take length is bounded" $ \(QC.NonNegative count) xs ->
        lengthList (takeList count (fromList xs :: List Int)) == min count (length xs)
    ]
