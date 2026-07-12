module Apprentice.B001.Parser
  ( ParseError (..)
  , parseExpr
  ) where

import Apprentice.B001.Syntax (Expr)

data ParseError = ParseError
  { parseOffset :: Int
  , parseExpected :: [String]
  , parseFound :: Maybe Char
  }
  deriving (Eq, Show)

parseExpr :: String -> Either ParseError Expr
parseExpr = error "TODO B001: learner implements parseExpr"
