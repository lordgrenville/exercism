distance :: String -> String -> Maybe Int
distance a b
  | length a /= length b = Nothing
  | null a               = Just 0
  | otherwise            = Just $ getDistance a b

getDistance :: String -> String -> Int
getDistance [] [] = 0
getDistance [x] [y] = if x == y then 1 else 0
getDistance (x:xs) (y:ys) = getDistance [x] [y] + getDistance xs ys
