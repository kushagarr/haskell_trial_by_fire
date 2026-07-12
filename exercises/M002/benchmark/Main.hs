module Main (main) where

import Apprentice.M002.Exercise (fromList, reverseList, toList)
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [1000, 2000, 4000, 8000]

measure :: Int -> IO ()
measure n = do
  let input = fromList [1 .. n]
  start <- getCPUTime
  result <- evaluate (sum (toList (reverseList input)))
  end <- getCPUTime
  printf "n=%d checksum=%d cpu_ps=%d\n" n result (end - start)
