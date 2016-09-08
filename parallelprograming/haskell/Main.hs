module Main where

import Matrix
import Data.Array
import Control.DeepSeq

instance NFData a => NFData (Matrix a) where
  rnf (Matrix s) = rnf s

main = do
  let n = 200
      a = Matrix $ listIntArray2 (n, n) [1..n^2]
      res = a * a
      (Matrix arr) = res
  arr `deepseq` print (arr ! (n, n))
