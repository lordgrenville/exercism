module ArmstrongNumbers (armstrong) where

toDigits :: Int -> [Int]
toDigits 0 = []
toDigits x = toDigits (x `div` 10) ++ [x `mod` 10]

armstrong :: Int -> Bool
armstrong x = x == sum (map (^z) $ toDigits x) where z = length $ toDigits x
