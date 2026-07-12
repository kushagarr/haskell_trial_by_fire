module Main (main) where

import Apprentice.M008.Exercise (sortPermutation)
import Control.Exception (evaluate)
import Data.List (sort)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [100, 200, 400, 800]

measure :: Int -> IO ()
measure n = do
  let input = reverse [1 .. n]
  start <- getCPUTime
  result <- evaluate (sortPermutation sort input)
  end <- getCPUTime
  printf "n=%d result=%s cpu_ps=%d\n" n (show result) (end - start)
