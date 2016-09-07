module Matrix where

import Data.Array
import Data.List(groupBy, intercalate)
import Data.Function(on)
import Control.Parallel.Strategies(using, parList, rpar)

type IntArray2 = Array (Int, Int)

listIntArray2 upBounds = listArray (botBounds, upBounds)
  where botBounds = (1,1) :: (Int, Int)

newtype Matrix a = Matrix (IntArray2 a)

instance Num a => Num (Matrix a) where
  (+) = indOp (+)
  (-) = indOp (-)
  (*) = matrixOp (\a b -> 
          let (_, (n1, m1)) = bounds a
              (_, (n2, m2)) = bounds b
              resMat = [ sum [ a ! (i, k) * b ! (k, j) 
                             | k <- [1..m1]
                             ]
                       | i <- [1..n1], j <- [1..m2]
                       ] `using` (parList rpar)
          in if m1 == n2
             then listIntArray2 (n1, m2) resMat
             else error "Matrix.(*) first width must be the same as second height"
        )
  fromInteger x = Matrix $ listIntArray2 (1, 1) [fromInteger x]
  abs _ = error "Matrix.abs"
  signum _ = error "Matrix.signum"
  
matrixOp f (Matrix a) (Matrix b) = Matrix $ f a b
matmap f (Matrix a) = Matrix $ f a

indOp f = matrixOp $ (\a b -> 
    let bounds_a = bounds a
        bounds_b = bounds b
    in if bounds_a == bounds_b
       then listArray bounds_a $ zipWith f (elems a) (elems b)
       else error "indOp: sizes must be the same"
  )

instance Show a => Show (Matrix a) where
  show (Matrix arr) = intercalate "\n" . map ( intercalate "\t" 
                                             . map (show . snd)
                                             ) 
                    . groupBy ((==) `on` fst.fst) 
                    $ assocs arr
