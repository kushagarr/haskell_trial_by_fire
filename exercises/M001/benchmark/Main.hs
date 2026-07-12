module Main (main) where

import Apprentice.M001.Exercise (Command (Reject, Reopen, Submit), Phase (Draft), runCommands)
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [1000, 2000, 4000, 8000]

measure :: Int -> IO ()
measure n = do
  let commands = take n (cycle [Submit, Reject, Reopen])
  start <- getCPUTime
  result <- evaluate (runCommands Draft commands)
  result `seq` pure ()
  end <- getCPUTime
  printf "n=%d cpu_ps=%d\n" n (end - start)
