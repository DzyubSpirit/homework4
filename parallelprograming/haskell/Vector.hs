module Vector where

import Data.Array
import Data.List(groupBy, intercalate)
import Data.Function(on)

type IntArray = Array Int

listIntArray upBound = listArray (1, upBound)
singleton x = listIntArray 1 [x]

newtype Vector a = Vector (IntArray a)

instance Num a => Num (Vector a) where
  (+) = indOp (+)
  (-) = indOp (-)
  (*) = vecOp (\a b -> 
          singleton . sum $ zipWith (*) (elems a) (elems b)
        )
  abs _ = error "Vector.abs"
  signum _ = error "Vector.signum"
  fromInteger = Vector . singleton . fromInteger
                

vecOp f (Vector a) (Vector b) = Vector $ f a b
indOp f = vecOp (\a b ->
            let (_, n1) = bounds a
                (_, n2) = bounds b
            in if n1 == n2
               then listIntArray n1 $ (zipWith f `on` elems) a b
               else error "Vector must be the same size"
          )
