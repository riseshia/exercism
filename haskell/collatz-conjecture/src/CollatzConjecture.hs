module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1 = Nothing
  | otherwise = Just (countStep n)

countStep :: Integer -> Integer
countStep 1 = 0
countStep n = if even n
              then 1 + countStep (n `div` 2)
              else 1 + countStep (3 * n + 1)
