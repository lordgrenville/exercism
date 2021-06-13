module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance a b
  | length a /= length b = Nothing
  | otherwise = Just $ getDistance a b

getDistance :: String -> String -> Int
getDistance [] [] = 0
getDistance [x] [y] = if x == y then 0 else 1
getDistance (x : xs) (y : ys) = getDistance [x] [y] + getDistance xs ys
