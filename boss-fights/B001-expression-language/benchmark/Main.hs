module Main (main) where

import Apprentice.B001.Eval (eval)
import Apprentice.B001.Pretty (pretty)
import Apprentice.B001.Syntax (BinaryOp (Add), Expr (Binary, Lit))
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [100, 200, 400, 800]

leftChain :: Int -> Expr
leftChain n = go n (Lit 0)
  where
    go 0 expression = expression
    go k expression = go (k - 1) (Binary Add expression (Lit 1))

measure :: Int -> IO ()
measure n = do
  let expression = leftChain n
  start <- getCPUTime
  renderedLength <- evaluate (length (pretty expression))
  value <- evaluate (eval [] expression)
  value `seq` pure ()
  end <- getCPUTime
  printf "nodes=%d rendered=%d cpu_ps=%d\n" n renderedLength (end - start)
