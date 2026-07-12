module Main (main) where

import Apprentice.M006.Exercise (PathSegment (Field), parsePort)
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [1000, 2000, 4000, 8000]

measure :: Int -> IO ()
measure n = do
  let input = Just (replicate n '9')
  start <- getCPUTime
  result <- evaluate (parsePort [Field "port"] input)
  result `seq` pure ()
  end <- getCPUTime
  printf "digits=%d cpu_ps=%d\n" n (end - start)
