module Intro where

-- generowanie dokładnie 17 pierwszych liczb nieparzystych
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

-- wywołanie incAndTriple 3 zwróci 12
-- wywołanie map specialCases [1..4] zwróci ["Hello"," ","World","!"]
-- wywołanie concat (map specialCases [1..4]) zwróci "Hello World!"
-- wywołanie concat (map specialCases [1..6]) zwróci "Hello World!??????"

head' :: [a] -> a
head' [] = error "Empty list."
head' (x:_) = x

-- własna implementacja funkcji length
length1 :: (Num b) => [a] -> b
length1 list = sum([1| _ <- list])

-- implementacja funkcji length ze strony http://learnyouahaskell.com/syntax-in-functions
length2 :: (Num b) => [a] -> b
length2 [] = 0
length2 (_:xs) = 1 + length2 xs

-- implementacja funkcji sum ze strony http://learnyouahaskell.com/syntax-in-functions
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

take' x list =
    if length list == x
        then list
    else take' x (init list)
map' fun arg = [fun x| x<-arg]
(+++) [] ys = ys
(+++) (x:xs) ys = x : ((+++) xs ys)

-- prosta funkcja, tylko do zaznajomienia się ze składnią
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"
