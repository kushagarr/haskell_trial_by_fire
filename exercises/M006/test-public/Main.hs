module Main (main) where

import Apprentice.M006.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

portPath :: [PathSegment]
portPath = [Field "port"]

tests :: TestTree
tests = testGroup "M006 public contract"
  [ testCase "missing port" $ parsePort portPath Nothing @?= Left (MissingValue portPath)
  , testCase "valid lower boundary" $ parsePort portPath (Just "1") @?= Right (Port 1)
  , testCase "valid upper boundary" $ parsePort portPath (Just "65535") @?= Right (Port 65535)
  , testCase "reject empty decimal" $ parsePort portPath (Just "") @?= Left (InvalidDecimal portPath "")
  , testCase "reject signed decimal" $ parsePort portPath (Just "+80") @?= Left (InvalidDecimal portPath "+80")
  , testCase "reject surrounding space" $ parsePort portPath (Just " 80") @?= Left (InvalidDecimal portPath " 80")
  , testCase "reject mixed decimal" $ parsePort portPath (Just "8x") @?= Left (InvalidDecimal portPath "8x")
  , testCase "reject zero" $ parsePort portPath (Just "0") @?= Left (PortOutOfRange portPath)
  , testCase "reject upper overflow" $ parsePort portPath (Just "65536") @?= Left (PortOutOfRange portPath)
  , testCase "validate endpoint" $ validateEndpoint (Just "api") (Just "443") @?= Right (Endpoint "api" (Port 443))
  , testCase "missing name fails first" $ validateEndpoint Nothing (Just "bad") @?= Left (MissingValue [Field "name"])
  , testCase "empty name fails first" $ validateEndpoint (Just "") (Just "bad") @?= Left (InvalidText [Field "name"] "")
  , testCase "prepend covers every error constructor" $
      map (prependPath (Field "outer")) [MissingValue [], InvalidText [] "bad", InvalidDecimal [] "x", PortOutOfRange []]
        @?= [MissingValue [Field "outer"], InvalidText [Field "outer"] "bad", InvalidDecimal [Field "outer"] "x", PortOutOfRange [Field "outer"]]
  , QC.testProperty "valid port decimal round trip" $ QC.forAll (QC.chooseInt (1, 65535)) $ \portNumber ->
      parsePort portPath (Just (show portNumber)) == Right (Port portNumber)
  , QC.testProperty "prepend composes in order" $ \outer inner ->
      prependPath (Field outer) (prependPath (Field inner) (MissingValue [])) == MissingValue [Field outer, Field inner]
  ]
