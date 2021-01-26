module Bob (responseFor) where
import Data.Char
import Data.List

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace

hasLetters :: String -> Bool
hasLetters s = any ((`elem` "abcdefghijklmnopqrstuvwxyz1234567890") . toLower) (nub s)

isCaps :: String -> Bool
isCaps s = s == map toUpper s && s /= map toLower s

isQuestion :: String -> Bool
isQuestion s = last s == '?'

responseFor :: String -> String
responseFor x
  | s == ""                  = "Fine. Be that way!"
-- Check for this first since isQuestion is unsafe
  | isQuestion s && isCaps s = "Calm down, I know what I'm doing!"
  | isQuestion s             = "Sure."
  | isCaps s                 = "Whoa, chill out!"
  | not $ hasLetters s       = "Fine. Be that way!"
  | otherwise                = "Whatever."
    where s = trim x

