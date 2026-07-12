module Main (main) where

import Apprentice.M007.Exercise (Summary (labelsInOrder), summarize)
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [1000, 2000, 4000, 8000]

measure :: Int -> IO ()
measure n = do
  let entries = [(show k, k) | k <- [1 .. n]]
  start <- getCPUTime
  count <- evaluate (length (labelsInOrder (summarize entries)))
  end <- getCPUTime
  printf "n=%d labels=%d cpu_ps=%d\n" n count (end - start)
