module Main where

import Control.DeepSeq
import Control.Parallel.Strategies

longFunc :: Int -> Int
longFunc 0 = 0
longFunc n = let n' = n -1
             in n' `seq` longFunc n'

main = do
  runEval $ do
    list <- parList rpar $ map longFunc [1..25000000]
    rseq $ putStrLn "Hello"
