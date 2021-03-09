module Main where

import System.Environment
import Control.Monad
import Data.Set hiding (map)



main :: IO()
main = do
        f <- readFile "input"
        let resultado = comparing $ func1 $ lines f
        print (show resultado)

func1 :: [String] -> [Int]
func1  =  map read

sum' :: Int -> [Int]-> Int 
sum' _ [] = 0
sum' n (x:xs) | (n + x) == 2020 = n * x
              | otherwise  = sum' n xs

comparing :: [Int] -> Int 
comparing [] = 0
comparing (x:xs) | sum' x xs == 0  = comparing xs
                 | otherwise  = sum' x xs
