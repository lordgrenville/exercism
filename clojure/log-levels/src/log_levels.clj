(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (str/trim (subs s (+ 3 (str/index-of s "]")))))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case (subs s (+ 1 (str/index-of s "[")) (str/index-of s "]"))))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (let [msg (message s) lvl (log-level s)]
   (str msg " (" lvl ")")))
