module School (School, add, empty, grade, sorted) where

type Grade = Int
type Roster = [String]
type School = [(Grade, Roster)]

add :: Int -> String -> School -> School
add gradeNum student school = error "You need to implement this function."

empty :: School
empty = error "You need to implement this function."

grade :: Int -> School -> [String]
grade gradeNum school = error "You need to implement this function."

sorted :: School -> [(Int, [String])]
sorted school = error "You need to implement this function."