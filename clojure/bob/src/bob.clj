(ns bob
  (:require [clojure.string :refer [upper-case ends-with? trim lower-case]]
))

(defn response-for
  [input]
  (cond
    (= "" (trim input)) "Fine. Be that way!"
    (and
      (= input (upper-case input))
      (not (= input (lower-case input)))) "Whoa, chill out!"
    (ends-with? input "?") "Sure."
    true "Whatever."
  )
)
