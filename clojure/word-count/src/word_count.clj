(ns word-count
  (:require [clojure.string :refer [split lower-case]]))

(defn word-count [sentence]
  (reduce
    #(assoc %1 %2 (inc (%1 %2 0)))
    {}
    (split (lower-case sentence) #"\W+"))
)
