module Main (main) where

import Apprentice.M005.Exercise
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "M005 public contract"
  [ testCase "successful chain" $ preferredLead u1 users teams @?= Just "Ada"
  , testCase "missing user" $ preferredLead (UserId 99) users teams @?= Nothing
  , testCase "missing preference" $ preferredLead u2 users teams @?= Nothing
  , testCase "missing team" $ preferredLead u3 users teams @?= Nothing
  , testCase "missing lead" $ preferredLead u4 users teams @?= Nothing
  , testCase "present empty lead" $ preferredLead u5 users teams @?= Just ""
  , testCase "first duplicate wins" $ findTeam t1 (Team t1 (Just "first") : teams) @?= Just (Team t1 (Just "first"))
  , QC.testProperty "nonmatching user prefix is irrelevant" $ \raw ->
      let fresh = UserId (1000 + abs raw)
       in findUser u1 (User fresh Nothing : users) == findUser u1 users
  , QC.testProperty "matching user head wins" $ \teamNumber ->
      let candidate = User u1 (Just (TeamId teamNumber))
       in findUser u1 (candidate : users) == Just candidate
  ]

u1, u2, u3, u4, u5 :: UserId
u1 = UserId 1
u2 = UserId 2
u3 = UserId 3
u4 = UserId 4
u5 = UserId 5

t1, t2, t3 :: TeamId
t1 = TeamId 10
t2 = TeamId 20
t3 = TeamId 30

users :: [User]
users = [User u1 (Just t1), User u2 Nothing, User u3 (Just (TeamId 99)), User u4 (Just t2), User u5 (Just t3)]

teams :: [Team]
teams = [Team t1 (Just "Ada"), Team t2 Nothing, Team t3 (Just "")]
