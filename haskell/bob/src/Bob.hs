module Bob (responseFor) where

import Data.Char (toUpper, toLower, isSpace)

toUpperString :: String -> String
toUpperString string = map toUpper string

toLowerString :: String -> String
toLowerString string = map toLower string

trim :: String -> String
trim = f . f
   where f = reverse . dropWhile isSpace

responseFor :: String -> String
responseFor = trimedResponseFor . trim

trimedResponseFor :: String -> String
trimedResponseFor xs
  | xs == "" = "Fine. Be that way!"
  | xs == toUpperString xs && xs /= toLowerString xs = "Whoa, chill out!"
  | last xs == '?' = "Sure."
  | otherwise = "Whatever."
