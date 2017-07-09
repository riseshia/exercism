module Pangram (isPangram) where

import Data.Set as Set
import Distribution.Simple.Utils as Utils
import Data.Char (isAlpha, toLower)

correctSet = Set.fromList (isAlpha)

isPangram :: String -> Bool
isPangram = (correctSet `Set.isSubsetOf`) . Set.fromList . Utils.lowercase
