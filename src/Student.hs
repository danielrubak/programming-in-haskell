module Student where

data Student = Student {firstName::String, lastName::String, age::Int} 
   deriving (Show, Read, Eq)

listToProcess :: [Student]
listToProcess = [Student "Alicja" "Akla" 21, Student "Bartek" "Bodo" 20, Student "Celina" "Czyzyk" 21, Student "Damian" "Dab"  22, Student "Eustachy" "Elo" 20]

-- Student object for tests
s1 = Student "Daniel" "Rubak" 24

-- Get full name of selected student, v1
getFullStudentName1 :: Student -> String
getFullStudentName1 (Student {firstName = fn, lastName = ln, age = a}) = fn ++ " " ++ ln

-- Get full name of selected student, v2
getFullStudentName2 :: Student -> String
getFullStudentName2 (Student fn ln _) = fn ++ " " ++ ln

-- Get full name of selected student, v3
getFullStudentName3 :: Student -> String
getFullStudentName3 s = firstName s ++ " " ++ lastName s

fullStudentsNameList :: [Student] -> [String]
fullStudentsNameList studentsList = [(firstName s) ++ " " ++ (lastName s) | s <- studentsList]