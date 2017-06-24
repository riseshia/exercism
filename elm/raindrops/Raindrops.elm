module Raindrops exposing (..)


type alias Drop =
    ( Int, String )


concatText : Int -> String -> Drop -> Drop
concatText divider text ( num, acc ) =
    if num % divider == 0 then
        ( num, acc ++ text )
    else
        ( num, acc )


addDefaultText : Drop -> String
addDefaultText ( num, text ) =
    if text == "" then
        toString num
    else
        text


raindrops : Int -> String
raindrops num =
    let
        addPling =
            concatText 3 "Pling"

        addPlang =
            concatText 5 "Plang"

        addPlong =
            concatText 7 "Plong"
    in
        addPling ( num, "" ) |> addPlang |> addPlong |> addDefaultText



-- if num % 3 == 0 then
--     "Pling"
-- else if num % 5 == 0 then
--     "Plang"
-- else if num % 7 == 0 then
--     "Plong"
-- else
--     toString num
