module Accumulate exposing (..)


accumulate : (a -> a) -> List a -> List a
accumulate fn list =
    case list of
        head :: tail ->
            fn head :: (accumulate fn tail)

        [] ->
            []
