module Main (main) where

import Apprentice.M005.Exercise
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [1000, 2000, 4000, 8000]

measure :: Int -> IO ()
measure n = do
  let target = UserId n
      users = [User (UserId k) Nothing | k <- [1 .. n]]
  start <- getCPUTime
  result <- evaluate (findUser target users)
  result `seq` pure ()
  end <- getCPUTime
  printf "n=%d cpu_ps=%d\n" n (end - start)
