module Isogram (isIsogram) where

import Data.List
import Data.Char
import qualified Data.Text as T

isIsogram :: String -> Bool
isIsogram x = length (nub y) == length y
    where y = T.unpack $ T.toLower $ T.pack (filter isLetter x)
