(ns cars-assemble)

(def failure-rate-map
  {0 0,
   1 1,
   2 1,
   3 1,
   4 1,
   5 0.9,
   6 0.9,
   7 0.9,
   8 0.9,
   9 0.8,
   10 0.77})

(defn
  production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (double
   (*
    (* 221 speed)
    (failure-rate-map speed))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))
