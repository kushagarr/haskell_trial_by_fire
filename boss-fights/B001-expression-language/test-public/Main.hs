module Main (main) where

import Apprentice.B001.Eval
import Apprentice.B001.Parser
import Apprentice.B001.Pretty
import Apprentice.B001.Syntax
import Data.Either (isLeft)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (assertBool, testCase, (@?=))
import qualified Test.Tasty.QuickCheck as QC

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "B001 public contract"
  [ testCase "parse literal and whitespace" $ parseExpr " 42\n" @?= Right (Lit 42)
  , testCase "multiplication precedence" $ parseExpr "1 + 2 * 3" @?= Right (Binary Add (Lit 1) (Binary Multiply (Lit 2) (Lit 3)))
  , testCase "subtraction is left associative" $ parseExpr "10 - 3 - 2" @?= Right (Binary Subtract (Binary Subtract (Lit 10) (Lit 3)) (Lit 2))
  , testCase "unary binds tightly" $ parseExpr "-1 * 2" @?= Right (Binary Multiply (Unary Negate (Lit 1)) (Lit 2))
  , testCase "let parses and evaluates" $ eval [] (Let "x" (Lit 2) (Binary Add (Var "x") (Lit 3))) @?= Right 5
  , testCase "first environment binding wins" $ eval [("x", 1), ("x", 2)] (Var "x") @?= Right 1
  , testCase "nested let shadows" $ eval [("x", 1)] (Let "x" (Lit 2) (Var "x")) @?= Right 2
  , testCase "division by zero is structural" $ eval [] (Binary Divide (Lit 9) (Lit 0)) @?= Left (DivisionByZero (Lit 0))
  , testCase "unknown variable is structural" $ eval [] (Var "missing") @?= Left (UnboundVariable "missing")
  , testCase "reject trailing garbage" $ assertBool "accepted trailing input" (isLeft (parseExpr "1 trailing"))
  , testCase "reject empty input" $ assertBool "accepted empty input" (isLeft (parseExpr " \t"))
  , testCase "canonical precedence rendering" $ pretty (Binary Add (Lit 1) (Binary Multiply (Lit 2) (Lit 3))) @?= "1 + 2 * 3"
  , QC.testProperty "pretty/parse exact round trip" $ QC.forAll wellFormedExpr $ \expr -> parseExpr (pretty expr) == Right expr
  , QC.testProperty "addition model" $ \left right ->
      eval [] (Binary Add (Lit left) (Lit right)) == Right (left + right)
  ]

wellFormedExpr :: QC.Gen Expr
wellFormedExpr = QC.sized generate
  where
    generate 0 = QC.oneof [Lit <$> smallInteger, Var <$> QC.elements ["x", "y", "value_1"]]
    generate n = QC.frequency
      [ (3, generate 0)
      , (1, Unary Negate <$> generate (n - 1))
      , (4, Binary <$> QC.elements [Add, Subtract, Multiply, Divide] <*> generate half <*> generate half)
      , (1, Let <$> QC.elements ["x", "y"] <*> generate half <*> generate half)
      ]
      where half = n `div` 2

smallInteger :: QC.Gen Integer
smallInteger = fromIntegral <$> QC.chooseInt (0, 1000)
