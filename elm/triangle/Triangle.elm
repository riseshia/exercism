module Triangle exposing (..)

import Set


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


validateInequality : List comparable -> Bool
validateInequality list =
    case List.maximum list of
        Just x ->
            List.sum list > x * 2

        Nothing ->
            Debug.crash "This cannot continue"


sizeToKind : Int -> Result String Triangle
sizeToKind size =
    case size of
        1 ->
            (Ok Equilateral)

        2 ->
            (Ok Isosceles)

        _ ->
            (Ok Scalene)


triangleKind : comparable -> comparable -> comparable -> Result String Triangle
triangleKind a b c =
    let
        list =
            [ a, b, c ]

        set =
            Set.fromList list
    in
        if List.any (\n -> n <= 0) list then
            (Err "Invalid lengths")
        else if not (validateInequality list) then
            (Err "Violates inequality")
        else
            sizeToKind (Set.size set)


version : Int
version =
    2
