module DNA (toRNA) where

letterMappings :: Char -> Either Char Char
letterMappings 'G' = Right 'C'
letterMappings 'C' = Right 'G'
letterMappings 'T' = Right 'A'
letterMappings 'A' = Right 'U'
letterMappings x   = Left x

toRNA :: String -> Either Char String
toRNA = mapM letterMappings
