module Student where

data Student = Student {
   firstName::String, 
   lastName::String, 
   age::Int
   } deriving (Read)

instance Show Student where
   show (Student fn ln a) = "Student {" ++ fn ++ ", " ++ ln ++ ", " ++ show a ++ "}"

instance Eq Student where
   (==) (Student fn ln a) (Student fn' ln' a') = (fn == fn') && (ln == ln') && (a == a')

listToProcess :: [Student]
listToProcess = [Student "Alicja" "Akla" 21, Student "Bartek" "Bodo" 20, Student "Celina" "Czyzyk" 21, Student "Damian" "Dab"  22, Student "Eustachy" "Elo" 20]

-- student object for tests
s1 = Student "Daniel" "Rubak" 24

-- get full name of selected student, v1
getFullStudentName1 :: Student -> String
getFullStudentName1 (Student {firstName = fn, lastName = ln, age = a}) = fn ++ " " ++ ln

-- get full name of selected student, v2
getFullStudentName2 :: Student -> String
getFullStudentName2 (Student fn ln _) = fn ++ " " ++ ln

-- get full name of selected student, v3
getFullStudentName3 :: Student -> String
getFullStudentName3 s = firstName s ++ " " ++ lastName s

fullStudentsNameList1 :: [Student] -> [String]
fullStudentsNameList1 studentsList = [(firstName s) ++ " " ++ (lastName s) | s <- studentsList]

fullStudentsNameList2 :: [Student] -> [String]
fullStudentsNameList2 studentsList = map getFullStudentName2 studentsList

fullStudentsNameList3 :: [Student] -> [String]
fullStudentsNameList3 studentsList = [getFullStudentName2 s | s <- studentsList]

-- make list of tuples containing order number and Student object 
studentsOrderedTuples :: [Student] -> [(Int, Student)]
studentsOrderedTuples studentsList = zip [1..] studentsList

-- input for testing report generator
inputTuples = studentsOrderedTuples listToProcess

-- generate report from student list
getReportForTuple :: (Int, Student) -> String
getReportForTuple (num, (Student fn ln a)) =
   (show num) ++ ". student: " ++ ln ++ " " ++ [(head fn)] ++ ". wiek: " ++ (show a) ++ "\n"

makeStudentsReport :: [(Int, Student)] -> String
makeStudentsReport tuplesList = foldr (++) "" (map getReportForTuple tuplesList)
   
makeStudentsReportIO :: [(Int, Student)] -> IO()
makeStudentsReportIO tuplesList = putStr (foldr (++) "" (map getReportForTuple tuplesList))

-- students list to html table
getStudentHtml :: Student -> String
getStudentHtml (Student fn ln a) = 
   "<tr><th>" ++ ln ++ "</th><th>" ++ fn ++ "</th><th>" ++ (show a) ++ "</th></tr>"

getStudentsHtmlTable :: [Student] -> String
getStudentsHtmlTable studentsList = "<table>" ++ foldr (++) "" (map getStudentHtml studentsList) ++ "</table>"

-- list of students with changed names
modifiedList = [Student "AlicjaX" "Akla" 21, Student "BatrekX" "Bodo" 20, Student "Celina" "Czyzyk" 21, Student "DamianX" "Dab"  22, Student "Eustachy" "Elo" 20]

getFirstNames studentsList = [(firstName s) | s <- studentsList]

studentsFirstNameChangeEvent oldName newName = 
   if oldName == newName then ""
   else oldName ++ " -> " ++ newName

-- get list of students whose names have changed
getStudentsDiffList originalList modifiedList = 
   filter (not . null) (zipWith (studentsFirstNameChangeEvent) (getFirstNames originalList) (getFirstNames modifiedList))
