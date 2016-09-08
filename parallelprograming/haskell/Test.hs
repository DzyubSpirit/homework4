module Main where

import Control.DeepSeq
import Control.Parallel.Strategies
import Control.Monad

longFunc :: Int -> Int
longFunc 0 = 0
longFunc n = let n' = n - 1
             in n' `seq` longFunc n'

main = do
  runEval $ do
    list <- rpar $ longFunc 10000000
    rseq $ putStrLn "Hello"
