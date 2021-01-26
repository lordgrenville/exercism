module Pangram (isPangram) where
import Data.List
import Data.Char

isPangram :: String -> Bool
isPangram text = res == "abcdefghijklmnopqrstuvwxyz" where res = map chr $ filter (\s -> s > 96 && s < 123) $ sort $ map (fromEnum . toLower)  $ nub text
