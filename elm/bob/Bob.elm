module Bob exposing (..)


isForceful : String -> Bool
isForceful text =
    if
        String.toUpper text
            == text
            && String.toUpper text
            /= String.toLower text
    then
        True
    else
        False


hey : String -> String
hey text =
    let
        trimedText =
            String.trim text
    in
        if trimedText == "" then
            "Fine. Be that way!"
        else if isForceful trimedText then
            "Whoa, chill out!"
        else if String.endsWith "?" trimedText then
            "Sure."
        else
            "Whatever."
