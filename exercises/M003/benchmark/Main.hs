module Main (main) where

import Apprentice.M003.Exercise (sumStrict)
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [10000, 20000, 40000, 80000]

measure :: Int -> IO ()
measure n = do
  let input = [1 .. n]
  start <- getCPUTime
  result <- evaluate (sumStrict input)
  end <- getCPUTime
  printf "n=%d checksum=%d cpu_ps=%d\n" n result (end - start)
