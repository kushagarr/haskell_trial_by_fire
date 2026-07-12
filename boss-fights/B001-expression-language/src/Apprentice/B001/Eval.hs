module Apprentice.B001.Eval
  ( Env
  , EvalError (..)
  , eval
  ) where

import Apprentice.B001.Syntax (Expr)

type Env = [(String, Integer)]

data EvalError
  = UnboundVariable String
  | DivisionByZero Expr
  deriving (Eq, Show)

eval :: Env -> Expr -> Either EvalError Integer
eval = error "TODO B001: learner implements eval"
