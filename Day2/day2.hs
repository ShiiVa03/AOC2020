module Main where

import System.Environment
import Control.Monad
import Data.Set hiding (map,take)
import Data.List.Split


main :: IO()
main = do 
        f <- readFile "passInput"
        let inputs =  lines f
            howmany = sum $ map ( fromEnum . checkValid . parseInput) inputs
        print(show howmany)
         
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

