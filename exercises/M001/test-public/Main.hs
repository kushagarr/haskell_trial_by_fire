module Main (main) where

import Apprentice.M001.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
  testGroup
    "M001 public contract"
    [ testCase "submit a draft" $ step Draft Submit @?= Right Submitted
    , testCase "approve a submission" $ step Submitted Approve @?= Right Approved
    , testCase "reject and reopen" $ runCommands Submitted [Reject, Reopen] @?= Right Draft
    , testCase "approved is terminal" $ step Approved Reopen @?= Left (InvalidTransition Approved Reopen)
    , testCase "first failure has zero-based index" $
        runCommands Draft [Submit, Approve, Reopen] @?= Left (2, InvalidTransition Approved Reopen)
    , QC.testProperty "empty trace is identity" $ QC.forAll phaseGen $ \phase ->
        runCommands phase [] == Right phase
    , QC.testProperty "one command agrees with step" $ QC.forAll phaseGen $ \phase ->
        QC.forAll commandGen $ \command ->
          runCommands phase [command] == either (\err -> Left (0, err)) Right (step phase command)
    ]

phaseGen :: QC.Gen Phase
phaseGen = QC.elements [minBound .. maxBound]

commandGen :: QC.Gen Command
commandGen = QC.elements [minBound .. maxBound]
