module Apprentice.B001.Syntax
  ( UnaryOp (..)
  , BinaryOp (..)
  , Expr (..)
  , isValidIdentifier
  , wellFormed
  ) where

data UnaryOp = Negate
  deriving (Eq, Show)

data BinaryOp = Add | Subtract | Multiply | Divide
  deriving (Eq, Show)

data Expr
  = Lit Integer
  | Var String
  | Unary UnaryOp Expr
  | Binary BinaryOp Expr Expr
  | Let String Expr Expr
  deriving (Eq, Show)

isValidIdentifier :: String -> Bool
isValidIdentifier = error "TODO B001: learner implements isValidIdentifier"

wellFormed :: Expr -> Bool
wellFormed = error "TODO B001: learner implements wellFormed"
