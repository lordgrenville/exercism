module Format (special) where

special :: String -> Int -> [String]
special s n = take n $ words s
