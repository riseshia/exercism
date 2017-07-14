module RunLength (decode, encode) where

import Data.Char

decode :: String -> String
decode "" = ""
decode encodedText = reverse $ decodeR encodedText ""

decodeR :: String -> String -> String
decodeR "" rawText = rawText
decodeR encodedText rawText =
  let (digits, (head:tail)) = span isNumber encodedText
  in
    decodeR tail $ (++ rawText) $ dup digits head

dup :: String -> Char -> String
dup "" chr = [chr]
dup digits chr = replicate (read digits :: Int) chr

encode :: String -> String
encode "" = ""
encode text = encodeR text ""

encodeR :: String -> String -> String
encodeR "" encodedText = encodedText
encodeR rawText encodedText =
  let head:tail = rawText
      (token, restText) = span (\x -> x == head) rawText
      newEncoded = encodeChar token
  in
    encodeR restText $ (++ newEncoded) $ encodedText

encodeChar :: String -> String
encodeChar [chr] = [chr]
encodeChar token =
  let count = length token
  in (show count) ++ [(head token)]
