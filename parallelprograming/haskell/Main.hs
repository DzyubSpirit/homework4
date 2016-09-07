module Main where

import Matrix

main = do
  let a = Matrix $ listIntArray2 (4000, 4000) [1..16000000]
  a * a `seq` putStrLn "Ended"
