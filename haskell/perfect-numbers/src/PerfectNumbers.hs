module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquot :: Int -> Int
aliquot x = sum $ filter (\n -> x `mod` n == 0) [1 .. x `div` 2]

classify :: Int -> Maybe Classification
classify n
  | n < 1 = Nothing
  | aliquot n == n = Just Perfect
  | aliquot n < n = Just Deficient
  | aliquot n > n = Just Abundant
  | otherwise = Nothing
