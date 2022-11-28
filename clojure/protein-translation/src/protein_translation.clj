(ns protein-translation)

(def codon-map
  {"AUG" "Methionine",
   "UUU" "Phenylalanine",
   "UUC" "Phenylalanine",
   "UUA" "Leucine",
   "UUG" "Leucine",
   "UCU" "Serine",
   "UCC" "Serine",
   "UCA" "Serine",
   "UCG" "Serine",
   "UAU" "Tyrosine",
   "UAC" "Tyrosine",
   "UGU" "Cysteine",
   "UGC" "Cysteine",
   "UGG" "Tryptophan",
   "UAA" "STOP",
   "UAG" "STOP",
   "UGA" "STOP",
   })

(defn translate-codon [codon]
  (codon-map codon)
)

(defn translate-rna [RNA]
  (take-while (fn [codon] (not (= codon "STOP"))) (map translate-codon (map #(apply str %) (partition 3 RNA)))))
