module Main where

import System.Environment
import Control.Monad
import Data.Set hiding (map)



main :: IO()
main = do
        f <- readFile "input"
        let inputs = map read $ lines f
            resultado = head [x*y | x <- inputs , y <- inputs, x + y ==2020]
        print (show resultado)
