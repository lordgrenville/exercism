module CollatzConjecture (collatz) where

doCollatz :: (Integer, Integer) -> (Integer, Integer)
doCollatz (a, 1) = (a, 1)
doCollatz (a, n)
    | even n    = doCollatz (a+1, n `div` 2)
    | otherwise = doCollatz (a+1, 3*n+1)

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1     = Nothing
  | n == 1    = Just 0
  | otherwise = Just (fst $ doCollatz (0, n))
