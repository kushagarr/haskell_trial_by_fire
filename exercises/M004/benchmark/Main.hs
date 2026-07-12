module Main (main) where

import Apprentice.M004.Exercise (Tree (Empty, Node), inorder)
import Control.Exception (evaluate)
import System.CPUTime (getCPUTime)
import Text.Printf (printf)

main :: IO ()
main = mapM_ measure [1000, 2000, 4000, 8000]

skew :: Int -> Tree Int
skew n = go n Empty
  where
    go 0 tree = tree
    go k tree = go (k - 1) (Node tree k Empty)

measure :: Int -> IO ()
measure n = do
  let tree = skew n
  start <- getCPUTime
  checksum <- evaluate (sum (inorder tree))
  end <- getCPUTime
  printf "n=%d checksum=%d cpu_ps=%d\n" n checksum (end - start)
