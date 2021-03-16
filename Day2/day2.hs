module Main where

import System.Environment
import Control.Monad
import Data.Set hiding (map,take,null)
import Data.List.Split
import Data.List


main :: IO()
main = do 
        f <- readFile "passInput"
        let inputs =  lines f
            howmany = sum $ map ( fromEnum . checkValid . parseInput) inputs
            howmany2 = sum $ map ( fromEnum . checkValid2 .parseInput) inputs        
        print(show howmany)
        print(show howmany2)
         
data Info = Info{
    min :: Int,
    max :: Int,
    letter :: Char,
    password :: String
}deriving(Show,Eq)

parseInput :: String-> Info
parseInput s = Info mi ma lett pass
    where allparts = words s
          mi = read $ head $ splitOn "-" $ head allparts
          ma = read $ last $ splitOn "-" $ head allparts
          lett  = head $ head $ splitOn "-" $ last $ take 2 allparts
          pass = last allparts

checkValid :: Info -> Bool 
checkValid (Info min max lett pass) = len >= min && len <= max
    where len = length[x | x <- pass , x == lett]

unJust :: Maybe x -> x
unJust (Just x) = x

checkValid2 :: Info -> Bool
checkValid2 (Info min max lett pass) | null index = False  
                                     | elem min list /= elem max list = True
                                     | otherwise = False
    where index = elemIndices lett pass
          list  = map (+1) index
          
