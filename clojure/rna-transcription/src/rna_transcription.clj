(ns rna-transcription)


(defn trans [strand]
  {:post [(not= nil %)]}
  (get {\G \C
        \C \G
        \T \A
        \A \U} strand)
)

(defn to-rna [dna]
  (apply str (map trans dna))
)
