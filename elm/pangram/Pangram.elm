module Pangram exposing (..)

import Set


hasAll : Set.Set Char -> Bool
hasAll set =
    Set.size set == 26


isPangram : String -> Bool
isPangram sentence =
    sentence
        |> String.toLower
        |> String.toList
        |> List.filter (\char -> 'a' <= char && char <= 'z')
        |> Set.fromList
        |> hasAll
