module DNA (nucleotideCounts, Nucleotide(..)) where
import Data.Map (Map, fromList, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

charToNucleotide :: Char -> Maybe Nucleotide
charToNucleotide c
  | c `elem` "ACGT" = Just (read [c] :: Nucleotide)
  | otherwise       = Nothing

listToMap :: [Nucleotide] -> Map Nucleotide Int
listToMap = foldr (\x -> insertWith (+) x 1) (fromList [(A, 0), (C, 0), (G, 0), (T, 0)])

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = case z of
  (Just x)  -> Right $ listToMap x
  Nothing   -> Left ""
  where z = mapM charToNucleotide xs

