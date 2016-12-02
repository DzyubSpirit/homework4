module Main where

import Control.Parallel.MPI.Simple (mpiWorld, commWorld, unitTag, send, recv)
import System.Random (getStdGen, randomRs)
import Data.List (intercalate, transpose)

size = 500

main :: IO ()
main = mpiWorld $ \size rank -> do
  case rank of
    3 -> do (msg, _status) <- recv commWorld 1 unitTag
            putStrLn msg
    i -> if i < 3
         then funcs !! (fromInteger $ toInteger i) >>= send commWorld 3 unitTag
         else return ()
    {-0 -> do (msg, _status) <- recv commWorld 1 unitTag-}
            {-putStrLn msg-}
    {-1 -> send commWorld 0 unitTag "Hello World"-}
    {-_ -> return ()                     -}

funcs = [f1, f2, f3]

f1 :: IO String
f1 = do
  [b, c, ma, me] <- sequence $ replicate 4 randMatrix
  let res = mult (mult b c) (mult ma me)
  return $ showResults ["b", "c", "ma", "me", "res"]
                       [b, c, ma, me, res]

f2 :: IO String
f2 = do
  [mk, mh, mf] <- sequence $ replicate 3 randMatrix
  let res = mult (transpose mk) (mult mh mf)
  return $ showResults ["mk", "mh", "mf", "res"]
                       [mk, mh, mf, res]

f3 :: IO String
f3 = do
  [mp, mr, t] <- sequence $ replicate 3 randMatrix
  let res = mult [[foldr1 max . concat $ mult mp mr]] t
  return $ showResults ["mp", "mr", "t", "res"]
                       [mp, mr, t, res]




showResults :: [String] -> [[[Int]]] -> String
showResults names matrixes= foldr (++) "" . map (\(a, b) -> concat [a, ":\n", b, "\n"])
    . zip names $ map showMatrix matrixes

showMatrix :: Show a => [[a]] -> String
showMatrix = intercalate "\n" . map (intercalate "\t" . map show)

mult :: Num a => [[a]] -> [[a]] -> [[a]]
mult m1 m2 = map multRaw m1
  where multRaw raw = map (\i -> sum . zipWith (*) raw $ map (!! i) m2) 
                          [0..length raw - 1]

randMatrix :: IO [[Int]]
randMatrix = splitArray size . randomRs (-10, 10) <$> getStdGen
                           
splitArray :: Int -> [a] -> [[a]]
splitArray n = take n . map fst . tail . iterate (splitAt n . snd) . ((,) [])
