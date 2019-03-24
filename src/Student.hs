module Student where

data Student = Student String String Int
    deriving Show

fullName (Student fn ln _) = fn ++ " " ++ ln