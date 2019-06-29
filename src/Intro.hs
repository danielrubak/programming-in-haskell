module Intro where

-- generating exactly the first 17 odd numbers
takeOddNum :: Int -> [Int]
takeOddNum x = take x [xs | xs <- [0..], odd xs]
first17OddNum = take 17 [x | x<-[0..], odd x]

getTriangles = [(x,y,z) | x <- [3..17], y <- [3..17], z <- [3..17], x < y + z || y < x + z || z < x + y]

getRightTriangles = [(x,y,z) | x <- [3..17], y <- [3..17], z <- [3..17], x^2 == y^2 + z^2 ]

incAndTriple v = ( v + 1 ) * 3

specialCases 1 = "Hello"
specialCases 2 = " "
specialCases 3 = "World"
specialCases 4 = "!"
specialCases x = "???"

-- incAndTriple 3 returns 12
-- map specialCases [1..4] returns ["Hello"," ","World","!"]
-- concat (map specialCases [1..4]) returns "Hello World!"
-- concat (map specialCases [1..6]) returns "Hello World!??????"

-- own implementation of list merging
merge_lists :: [a] -> [a] -> [a]
merge_lists [] [] = []
merge_lists (x:xs) [] = (x:xs)
merge_lists [] (x:xs) = (x:xs)
merge_lists (x:xs) (y:ys) = x:(merge_lists (xs) (y:ys))

-- own implementation of head function
head' :: [a] -> Maybe a
head' [] = Nothing
head' (x:_) = Just x

-- own implementation of length function
length1 :: (Num b) => [a] -> b
length1 list = sum([1| _ <- list])

-- length function implementation from http://learnyouahaskell.com/syntax-in-functions
length2 :: (Num b) => [a] -> b
length2 [] = 0
length2 (_:xs) = 1 + length2 xs

-- sum function implementation from http://learnyouahaskell.com/syntax-in-functions
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

take' :: Int -> [a] -> [a]
take' x list =
    if length list == x
        then list
    else take' x (init list)

map' :: (a->b) -> [a] -> [b]
map' fun arg = [fun x| x<-arg]

(+++) :: [a] -> [a] -> [a]
(+++) [] ys = ys
(+++) (x:xs) ys = x : ((+++) xs ys)

-- simple function, just for learning purposes
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

-- implementation of sum, product, reverse, and, or, head and tail fiunctions using fold{r,l}
-- foldl has the accumulator as the first param and the current value as the second one (\acc x -> ...)
-- foldr has the accumulator as the second param and the current value as the first one (\x acc -> ...)
fl_sum :: (Foldable t, Num a) => t a -> a
fl_sum xs = foldl (+) 0 xs

-- we can omit xs because 'foo a = bar b a' can be written as 'foo = bar b'
fr_sum :: (Foldable t, Num a) => t a -> a
fr_sum = foldr (+) 0

fl_product :: (Foldable t, Num a) => t a -> a
fl_product = foldl (*) 1

fr_product :: (Foldable t, Num a) => t a -> a
fr_product = foldr (*) 1

fl_reverse :: [a] -> [a]
fl_reverse = foldl (flip (:)) []
-- alternative version of fl_reverse
-- fl_reverse = foldl (\acc x -> x:acc) []

fr_reverse :: [a] -> [a]
fr_reverse  = foldr (\x acc -> acc ++ [x]) []

fl_and :: [Bool] -> Bool
fl_and = foldl (&&) True

fr_and :: [Bool] -> Bool
fr_and = foldr (&&) True

fl_or :: [Bool] -> Bool
fl_or = foldl (||) False

fr_or :: [Bool] -> Bool
fr_or = foldr (||) False

-- foldl1 work like foldl but use the first list element as starting value
fl_head :: [a] -> a
fl_head = foldl1 (\acc _ -> acc)

fr_head :: [a] -> a
fr_head = foldr1 (\x _ -> x)

fl_tail :: [a] -> a
fl_tail = foldl1 (\_ x -> x)

fr_tail :: [a] -> a
fr_tail = foldr1 (\_ acc -> acc)