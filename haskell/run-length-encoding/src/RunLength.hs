module RunLength (decode, encode) where

import Data.Char

decode :: String -> String
decode "" = ""
decode encodedText = decodeRec encodedText ""

decodeRec :: String -> String -> String
decodeRec "" rawText = rawText
decodeRec encodedText rawText =
  let (digits, char, tail) = consumeToken encodedText 0
      rawToken = decodeToken digits char
  in
    decodeRec tail (rawText ++ rawToken)

digits :: [Char]
digits = ['0'..'9']

consumeToken :: String -> Int -> (Int, Char, String)
consumeToken text num =
  let (head:tail) = text
      isDigit = head `elem` digits
  in
    case (isDigit, num) of
      (False, 0) -> (1, head, tail)
      (False, _) -> (num, head, tail)
      (True, _) -> consumeToken tail (10 * num + (digitToInt head))

decodeToken :: Int -> Char -> String
decodeToken 1 char = [char]
decodeToken count char = replicate count char

encode :: String -> String
encode "" = ""
encode text = encodeRec text ""

encodeRec :: String -> String -> String
encodeRec "" encText = encText
encodeRec (head:tail) encText =
  let (count, char, nextText) = takeContinuousChars tail head 1
      token = encodeToken count char
  in
    encodeRec nextText (encText ++ token)

takeContinuousChars :: String -> Char -> Int -> (Int, Char, String)
takeContinuousChars "" lastChar count = (count, lastChar, "")
takeContinuousChars text lastChar count =
  let (head:tail) = text
  in
    if lastChar == head
    then takeContinuousChars tail lastChar (count + 1)
    else (count, lastChar, text)


encodeToken :: Int -> Char -> String
encodeToken 1 char = [char]
encodeToken count char = (show count) ++ [char]
