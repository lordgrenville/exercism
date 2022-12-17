(ns phone-number)

(defn digit-not-one-or-zero [digit]
  (and (not (= \0 digit))
       (not (= \1 digit))))

(defn clean-number [num-string]
  ;; strip all non-digit characters from a string
  (filter #(Character/isDigit %) num-string))

(defn check-valid [num-string]
  ;; number is valid only if:
  ;; a) length is between 10-11 chars
  ;; b) if 11 chars, first digit must be 1
  ;; c) (after stripping first digit if 11), first and fourth can't be 0 or 1
  (let [clean-string (clean-number num-string)
        len (count clean-string)]
    (if (or (< len 10) (> len 11))
      false
      (if (= len 11)
        (if (= \1 (first clean-string))
          (check-valid (rest clean-string))
          false)
        (if (and (digit-not-one-or-zero (first clean-string))
                 (digit-not-one-or-zero (nth clean-string 3)))
          true
          false)))))

(defn number [num-string]
  ;; given
  (if (check-valid num-string)
    (let [clean-string (clean-number num-string)]
      (if (= (count clean-string) 10)
        (apply str (clean-number clean-string)) (apply str (rest (clean-number clean-string)))))
    "0000000000"))

(defn area-code [num-string]
  ;; get the first 3 chars of the cleaned up number
  (apply str (take 3 (number num-string))))

(defn pretty-print [num-string]
  (let [formatted-number (number num-string)]
    (apply str (concat
                "(" (area-code num-string) ")" " " (subs formatted-number 3 6) "-" (subs formatted-number 6)))))
