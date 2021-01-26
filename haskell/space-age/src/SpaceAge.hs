module SpaceAge (Planet(..), ageOn) where
-- use leap from q2 and if leap? no doesn't make sense
-- better implementation of secondsToYears

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

secondsToYears::Float -> Float
secondsToYears n = n / 31557600

ageOn::Planet -> Float -> Float
ageOn  Mercury  n =  secondsToYears n / 0.2408467 
ageOn  Venus    n =  secondsToYears n / 0.61519726
ageOn  Earth    n =  secondsToYears n
ageOn  Mars     n =  secondsToYears n / 1.8808158 
ageOn  Jupiter  n =  secondsToYears n / 11.862615 
ageOn  Saturn   n =  secondsToYears n / 29.447498 
ageOn  Uranus   n =  secondsToYears n / 84.016846 
ageOn  Neptune  n =  secondsToYears n / 164.79132 
