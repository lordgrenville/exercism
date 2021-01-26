module SumOfMultiples (sumOfMultiples) where
import Data.List (nub)

helper :: Integer -> Integer -> [Integer]
helper _ 0 = [0]
helper x y = filter (\n -> n `mod` y == 0) [1..(x - 1)]

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub $ concatMap (helper limit) factors
