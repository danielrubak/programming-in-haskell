Learn you a Haskell - In a nutshell
-----------------------------------

This is a summary of the "Learn You A Haskell" online book under http://learnyouahaskell.com/chapters.

***

# 1. Introduction

 * Haskell is a functional programming language.
 * "what it is" over "what to do"
 * Haskell is *lazy* - no calculation until a result is used
 * Statically typed - errors are caught on compile time
 * Type inference - it auto-detects the right type e.g. for `a = 5 + 4`
 * GHC is the most widely used Haskell compiler
 * To load a file you do:

 ```haskell
l: myfunctions.hs
```

***

# 2. Starting Out

 * Interactive GHC is started with `ghci`
 * Simple arithmetic:

 ```haskell
2 + 15
49 * 100
1892 - 1472
5 / 2
50 * 100 - 4999
50 * (100 - 4999)
```

 * Surround negative numbers with brackets:

 ```haskell
5 * (-3)
```

 * Boolean algebra with `True`, `False`, `not`, `&&`and `||`

 ```haskell
not (True && True)
```

 * Test for equality with `==` and inequality with `/=`
 * **infix** functions like `*` stand between the operators
 * Most functions are **prefix** functions:

  -  `succ 8` : successor (`9`)
  -  `min 3 4` : minimum of 2 values (`3`)
  -  `max 4 5` : maximum of 2 values (`5`)
  -  `div 13 6` : integral division of 2 integers (`2`)
  -  `odd 5` : wether number is odd (`True`)

 * Prefix functions can be written as infix with backticks:

 ```haskell
div 92 10
92 `div` 10
```

 * Functions are defined with `=`

 ```haskell
doubleMe x = x + x
doubleUs x y = x*2 + y*2
```

 * `if` have a `then` and always require a `else`

 ```haskell
    doubleSmallNumber x = if x > 100
        then x
        else x*2
```

 * `if` is also an expression

 * **Lists** are collections of homogenous elements: all elements have the same type

 ```haskell
lostNumbers = [4,8,15,16,23,42]
someString = "Some string"
```

 * Use `++` to put two lists together (goes through the complete list!)

 ```haskell
[1,2,3,4] ++ [6,7,8]
"Hello" ++ " " ++ "world"
```

 * Use `:` to prepend LHS to RHS list

 ```haskell
'A':" SMALL CAT"
1:[2,3,4,5]
1:2:3:[]
```

 * Use `!!` to get an element by index (0 based, index must exist)

 ```haskell
"Steve Buscemi" !! 6
```

 * Use `<`, `<=`, `>` and `>=` to lexographically compare lists

 * List ranges are defined with `..`:

 ```haskell
    [1..20]
    ['a'..'z']
```

 * Ranges can define a step size

 ```haskell
    [2,4..20]   ([2,4,6,8,10,12,16,18,20])
    [3,6..20]   ([3,6,9,12,15,18])
    [20,19..15] ([20,19,18,17,16,15])
```

 * List related functions

  -  `head [5,4,3]` : first element of a list (`5`)
  -  `tail [5,4,3]` : tail without head (`[4,3]`)
  -  `last [5,4,3]` : last element of a list (`3`)
  -  `init [5,4,3]` : list without tail (`[5,4]`)
  -  `length [5,4,3]` : number of elements (`3`)
  -  `null [5,4,3]` : wether list is empty (`False`)
  -  `reverse [5,4,3]` : reverse list (`[3,4,5]`)
  -  `take 3 [5,4,3,2,1]` : extract number of elements from list start (`[5,4,3]`)
  -  `drop 3 [5,4,3,2,1]` : drop first elements of a list (`[2,1]`)
  -  `maximum [5,4,3,2,1]` : maximum of orderable list (`5`)
  -  `minimum [5,4,3,2,1]` : minimum of orderable list (`1`)
  -  `sum [5,4,3]` : sum of number list (`12`)
  -  `product [5,4,3]` : product of number list (`60`)
  -  ``4 `elem` [5,4,3]`` : wether element is in list, usually infixed (`True`)
  -  `take 10 (cycle [1,2,3])` : repeat the list elements (`[1,2,3,1,2,3,1,2,3,1]`)
  -  `take 10 (repeat 5)` : repeat the element (`[5,5,5,5,5,5,5,5,5,5]`)
  -  `replicate 3 10` : repeat the element a number of times (`[10,10,10]`)

 * **List comprehensions** are similar to mathematical equations

 ```haskell
    [x*2 | x <- [1..5]]    ([2,4,6,8,10])
```

 * **Predicates** are conditions for list comprehensions

 ```haskell
    [x*2 | x <- [1..5], x*2 >= 5]   ([6,8,10])
```

 * There can be more than one predicates

 ```haskell
    [ x | x <- [10..20], x /= 10, x /= 15, x /= 19]
```

 * Comprehensions can be put inside a function

 ```haskell
    boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
```

 * Comprehensions can draw from several lists, which multiplies the lengths

 ```haskell
    [ x*y | x <- [2,3], y <- [3,4,5]]    ([6,8,10,9,12,15])
```

 * `_` is a dummy placeholder for a unused value

 ```haskell
    length' xs = sum [1 | _ <- xs]
```

 * List comprehensions can be nested

 ```haskell
    let xxs = [[1,2,3],[2,3,4],[4,5]]
    [ [x | x <- xs, even x] | xs <- xxs]    ([[2],[2,4],[4]]
```

 * **Tuples** can contain several types, but for the type of two Tuples to be the same, the number and types of their elements must match

 ```haskell
    (1,2)
    [(1,2), (3,2), (4,9)]
    [("Johnny", "Walker", 38), ("Kate", "Middleton", 27)]
```
    
 * Tuple related functions

  -  `fst (8,11)` : returns first component of a pair  (`8`)
  -  `snd (9,"Hey")` : returns second component of a pair (`"Hey"`)
  -  `zip [1..3] ['a'..'c']` : combine two lists to a list of tuples ( `[(1,'a'), (2,'b'), (3,'c')]` )

***

# 3. Types and Typeclasses

 * **Types** always start with an uppercase letter

 * Use `:t` to get a type of something

 ```haskell
    :t 'a'     ('a' :: Char)
    :t "HELLO"  ("HELLO" :: [Char])
    :t (True, 'a')   ( (True,'a') :: (Bool, Char) )
```

 * All functions should use a **type declaration** with `::` ("has type of"). 
Multiple arguments are also separeted with `->` just like the type declaration itself.

 ```haskell
    removeUppercase :: [Char] -> [Char]
    removeUppercase :: String -> String   (same as above)
    addThree :: Int -> Int -> Int -> Int
    addThree x y z = x + y + z 
```

 * Common types

  -  `Int` : Integer
  -  `Integer` : Integer (big)
  -  `Float` : Floating point
  -  `Double` : Floating point with double precision
  -  `Bool` : Boolean
  -  `Char` : Character
  -  Tuples, as mentioned in chapter 2
  -  `Ordering` : Can be `GT`, `LT` or `EQ`

 * **Type variables** can be used in function declarations. They stand for a type. 
Without a class constraint they mean "any type"

 ```haskell
    :t head    (head :: [a] -> a)
    :t fst     (fst :: (a, b) -> a)
```

 * **Typeclasses** are like interfaces for types. If a type is part of a typeclass 
it implements that class' behavior. The `=>` symbol separates the **class constraint** 
from the declaration:

 ```haskell
    :t (==)    ( (==) :: (Eq a) => a -> a -> Bool )
```

  -  `Eq` : supports equality testing
  -  `Ord` : can have ordering
  -  `Show` : can be presented as string
  -  `Read` : can be read from a string
  -  `Enum` : ordered type which can be enumerated
  -  `Bounded` : have an upper and lower bound
  -  `Num` : can act like a number
  -  `Integral` : can act like an integral number
  -  `Floating` : can act like a floating point number

 * Related functions

  -  ``5 `compare` 3`` : takes two `Ord` members of same type and returns a `Ordering` (`GT`)
  -  `show 3` : takes a `Show` and returns a `String` (`"3"`)
  -  `read "True"` : takes a `Read` and returns a `Read` (`True`)
  -  `succ LT` : takes a `Enum` and returns next element (`GT`)
  -  `pred 'b'` : takes a `Enum` and returns previous element (`'a'`)
  -  `minBound` :: Bool : takes a `Bounded` and returns lower bound (`False`)
  -  `maxBound` :: Bool : takes a `Bounded` and returns lower bound (`True`)
  -  `fromIntegral 5` : takes a `Integral` and returns a `Num`

 * *Type annotations* define the type of ambiguous expressions

 ```haskell
    (read "5" :: Float) * 4
```

***

# 4. Syntax in Functions

 * Functions can be defined with **pattern matching**. Patterns make sure that the input 
matches a specified pattern. The first matching pattern is executed. There should always 
be a catch-all pattern at the end

 ```haskell
    lucky :: (Integral a) => a -> String  
    lucky 7 = "LUCKY NUMBER SEVEN!"  
    lucky x = "Sorry, you're out of luck, pal!"   
```

 ```haskell
    factorial :: (Integral a) => a -> a  
    factorial 0 = 1  
    factorial n = n * factorial (n - 1)  
```

 ```haskell
    addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
    addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  
```

 ```haskell
    head' :: [a] -> a  
    head' [] = error "Can't call head on an empty list, dummy!"  
    head' (x:_) = x  
```

 ```haskell
    tell :: (Show a) => [a] -> String  
    tell [] = "The list is empty"  
    tell (x:[]) = "The list has one element: " ++ show x  
    tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
    tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y  
```

 ```haskell
    length' :: (Num b) => [a] -> b  
    length' [] = 0  
    length' (_:xs) = 1 + length' xs  
```

 ```haskell
    sum' :: (Num a) => [a] -> a  
    sum' [] = 0  
    sum' (x:xs) = x + sum' xs  
```

 * The **as pattern** is used to reference the "whole thing": Put a name followed by `@` 
in front of the pattern:

 ```haskell
    capital :: String -> String  
    capital "" = "Empty string, whoops!"  
    capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
```

 * **Guards** are similar to if statements and check for boolean conditions. There's no `=` 
after the function name:
 
 ```haskell
    bmiTell :: (RealFloat a) => a -> String  
    bmiTell bmi  
        | bmi <= 18.5 = "You're underweight, you emo, you!"  
        | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
        | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
        | otherwise   = "You're a whale, congratulations!"
```

 * Guards can be combined with patterns: If all guards of a function evaluate to `False`, 
evaluation falls through to the next pattern

 * Guards can have as many parameters as we want

 ```haskell
    bmiTell :: (RealFloat a) => a -> a -> String  
    bmiTell weight height  
        | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
        | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
        | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
        | otherwise                 = "You're a whale, congratulations!"  
```

 ```haskell
    max' :: (Ord a) => a -> a -> a  
    max' a b   
        | a > b     = a  
        | otherwise = b  
```

 ```haskell
    myCompare :: (Ord a) => a -> a -> Ordering  
    a `myCompare` b  
        | a > b     = GT  
        | a == b    = EQ  
        | otherwise = LT  
```

 * Guards can use a **where** block to define functions that are only visible inside the 
guard function

 ```haskell
    bmiTell :: (RealFloat a) => a -> a -> String  
    bmiTell weight height  
        | bmi <= skinny = "You're underweight, you emo, you!"  
        | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
        | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
        | otherwise     = "You're a whale, congratulations!"  
        where bmi = weight / height ^ 2  
              skinny = 18.5  
              normal = 25.0  
              fat = 30.0  
```

 * Combined with a patteren match

 ```haskell
    ...  
    where bmi = weight / height ^ 2  
          (skinny, normal, fat) = (18.5, 25.0, 30.0)  
```

 * More Examples

 ```haskell
    initials :: String -> String -> String  
    initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
        where (f:_) = firstname  
              (l:_) = lastname    
```

 ```haskell
    calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
    calcBmis xs = [bmi w h | (w, h) <- xs]  
        where bmi weight height = weight / height ^ 2
```

 * **Let bindings** are similar to where bindings. Their form is `let <bindings> in <expression>`.

 ```haskell
    cylinder :: (RealFloat a) => a -> a -> a  
    cylinder r h = 
        let sideArea = 2 * pi * r * h  
            topArea = pi * r ^2  
        in  sideArea + 2 * topArea  
```

 * The difference between let bindings and where bindings is that let bindings are 
expressions, just like if statements:

 ```haskell
    4 * (if 10 > 5 then 10 else 0) + 2     (42)
```
 
 ```haskell
    4 * (let a = 9 in a + 1) + 2    (42)
```

 * Let bindings can be used to introduce functions in a local scope

 ```haskell
    [let square x = x * x in (square 5, square 3, square 2)]     ( [(25,9,4)] )
```

 * To let bind several variables they get separated by a semicolon

 ```haskell
    (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)
```

 * Let bindings can be used with pattern matching

 ```haskell
    (let (a,b,c) = (1,2,3) in a+b+c) * 100      (600)
```

 * Let bindings can be used in list comprehensions

 ```haskell
    calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
    calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]  
```

 * Predicates come after the let binding

 ```haskell
    calcBmis :: (RealFloat a) => [(a, a)] -> [a]  
    calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]  
```

 * **Case expressions** are very similar to pattern matching:

 ```haskell
    head' :: [a] -> a  
    head' [] = error "No head for empty lists!"  
    head' (x:_) = x
```

 ```haskell
    head' :: [a] -> a  
    head' xs = case xs of [] -> error "No head for empty lists!"  
                          (x:_) -> x  
```

 ```haskell
    case expression of pattern -> result  
                       pattern -> result  
                       pattern -> result  
                       ...  
```

 * Pattern matching can only be used with function definitions. Cases expressions 
work everywhere

 ```haskell
    describeList :: [a] -> String  
    describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                                   [x] -> "a singleton list."   
                                                   xs -> "a longer list."  
```

***

# 5. Recursion

 * Try to start with the edge cases

 ```haskell
    maximum' :: (Ord a) => [a] -> a  
    maximum' [] = error "maximum of empty list"  
    maximum' [x] = x  
    maximum' (x:xs)   
        | x > maxTail = x  
        | otherwise = maxTail  
        where maxTail = maximum' xs
```

 ```haskell
    maximum' :: (Ord a) => [a] -> a  
    maximum' [] = error "maximum of empty list"  
    maximum' [x] = x  
    maximum' (x:xs) = max x (maximum' xs)
```

 ```haskell
    replicate' :: (Num i, Ord i) => i -> a -> [a]
    replicate' n x
        | n <= 0     = []
        | otherwhise = x:replicate' (n-1) x
```

 ```haskell
    take' :: (Num i, Ord i) => i -> [a] -> [a]  
    take' n _  
        | n <= 0   = []  
    take' _ []     = []  
    take' n (x:xs) = x : take' (n-1) xs
```

 ```haskell
    reverse' :: [a] -> [a]
    reverse' [] = []
    reverse' (x:xs) = reverse' xs ++ [x]
```

 ```haskell
    repeat' :: a -> [a]  
    repeat' x = x:repeat' x
```

 ```haskell
    zip' :: [a] -> [b] -> [(a,b)]  
    zip' _ [] = []  
    zip' [] _ = []  
    zip' (x:xs) (y:ys) = (x,y):zip' xs ys
```

 ```haskell
    elem' :: (Eq a) => a -> [a] -> Bool  
    elem' a [] = False  
    elem' a (x:xs)  
        | a == x    = True  
        | otherwise = a `elem'` xs
```

 * Quicksort can be implemented very elegantly. The main algorithm is 

> A sorted list is a list that has all the values smaller than (or equal to) the head of the 
> list in front (and those values are sorted), then comes the head of the list in the middle 
> and then come all the values that are bigger than the head (they're also sorted)

 ```haskell
    quicksort :: (Ord a) => [a] -> [a]  
    quicksort [] = []  
    quicksort (x:xs) =   
        let smallerSorted = quicksort [a | a <- xs, a <= x]  
            biggerSorted = quicksort [a | a <- xs, a > x]  
        in  smallerSorted ++ [x] ++ biggerSorted
```

***

# 6. Higher order functions

 * **Higher order functions** take other functions as parameters and return functions 
themselves (which is what makes up the ultimate *haskell experience*)

 * Functions in haskell only take *one* argument

 * **Curried functions** are used to give the impression that a function can have more 
than one argument: Calling `max 4 5` creates a function which takes *one* argument and 
returns `4` if the argument is smaller and the argument itself if it is bigger than `4`. 
These calls are equivalent:

 ```haskell
    max 4 5
    (max 4) 5
```

 * A space between two things ist simply **function application**. The type of `max` can
be written in two equivalent ways:

 ```haskell
max :: (Ord a) => a -> a -> a
max :: (Ord a) => a -> (a -> a)
```

 It takes an `a` and returns a function, which takes another `a` and returns an `a`.

 * If a function is callaed with not all parameters we get back a **partially applied** function.

 ```haskell
multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z
```

 When we do `multThree 3 5 9` it's actually  `((multThree 3) 5) 9` or 
`multThree :: (Num a) => a -> (a -> (a -> a))`. First `multThree 3` is applied, which returns a function. This function takes a single argument and returns another function. This other function again takes a single argument and returns the parameter multiplied by `15`. This allows us to do things like

 ```haskell
multTwoWithNine = multThree 9  
multTwoWithNine 2 3    (54)
multWithEighteen = multTwoWithNine 2  
multWithEighteen 10    (180)
```

 A function that compares the argument with `100` could be written like:

 ```haskell
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred x = compare 100 x
```

 The part `compare 100` returns a function that takes a number and compares it with `100`.
The above thus can be rewritten as

 ```haskell
compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100  
```

 * More examples

 ```haskell
divideByTen :: (Floating a) => a -> a  
divideByTen = (/10)
```

 ```haskell
isUpperAlphanum :: Char -> Bool  
isUpperAlphanum = (`elem` ['A'..'Z'])  
```

 The `-` sign is a special case.  For convenience `(-4)` means
***negative 4***.  So to create a partially applied function for this
use the `subtract` function: `(subtract 4)`.

 * The type declaration of functions that take functions look different

 ```haskell
applyTwice :: (a -> a) -> a -> a  
applyTwice f x = f (f x) 
```

 ```haskell
applyTwice (+3) 10               (13)
applyTwice (++ " HAHA") "HEY"    ("HEY HAHA HAHA")
applyTwice ("HAHA " ++) "HEY"    ("HAHA HAHA HEY")
applyTwice (multThree 2 2) 9     (144)
applyTwice (3:) [1]              ([3,3,1])
```

 * `zipWith` takes a function and two lists and applies the function on each two items of both lists to get a new list

 ```haskell
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
```

 If you are unsure of the type signature for your function you can
remove the type definition and see what Haskell infers it to be with
`:t` in GHCI.

 ```haskell
zipWith' (+) [4,2,5,6] [2,6,2,3]     ([6,8,7,9])
zipWith' max [6,3,2,1] [7,3,1,5]     ([7,3,2,5])
zipWith' (++) ["foo ", "bar "] ["fighters", "hoppers"]    (["foo fighters", "bar hoppers"])
zipWith' (*) (replicate 5 2) [1..]   ([2,4,6,8,10])
zipWith' (zipWith'(*)) [ [1,2], [3,4] ] [ [2,3], [4,5] ]  ([[2,6],[12,20]])
```

 * `flip` takes a function and returns a function where the first two parameters are flipped

 ```haskell
    flip' :: (a -> b -> c) -> (b -> a -> c)  
    flip' f = g  
        where g x y = f y x
```

 Or even shorter

 ```haskell
    flip' :: (a -> b -> c) -> b -> a -> c  
    flip' f y x = f x y
```

 ```haskell
zipWith (flip' div) [2,2..] [10,8,6,4,2]    ( [5,4,3,2,1] )
```

 * The **map** function takes a function and a list and returns a list with the function applied to every element

 ```haskell
map :: (a -> b) -> [a] -> [b]  
map _ [] = []  
map f (x:xs) = f x : map f xs
```

 ```haskell
map (+3) [1,5,3,1,6]             ([4,8,6,4,9])
map (++ "!") ["BIFF", "BANG"]    (["BIFF!","BANG!"])
map (replicate 2) [3..6]         ([[3,3],[4,4],[5,5],[6,6]])
map (map (^2)) [[1,2],[3,4,5]]   ([[1,4],[9,16,25]])
map fst [(1,2),(3,5)]            ([1,3])
```

 * The **filter** function takes a function that filters elements from a list

 ```haskell
filter :: (a -> bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
    | p x = x : filter p xs
    | otherwhise = filter p xs
```

 ```haskell
filter (>3) [1,5,3,6]    ([5,6])
filter even [1..10]      ([1,2,4,6,8,10])
let notNull x = not (null x) in filter notNull [[1,2,3],[],[2,2]]   ([[1,2,3],[2,2]])
```

 Alternative quicksort implementation

 ```haskell
    quicksort :: (Ord a) => [a] -> [a]    
    quicksort [] = []    
    quicksort (x:xs) =     
        let smallerSorted = quicksort (filter (<=x) xs)  
            biggerSorted = quicksort (filter (>x) xs)   
        in  smallerSorted ++ [x] ++ biggerSorted
```

 * The **takeWhile** function takes a predicate function and a list. It returns elements from the list until the predicate becomes `False`.

 Sum of all odd squares that are smaller than `10000`

 ```haskell
sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
```

 Alternative with list comprehension

 ```haskell
sum (takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)])
```

 * Example: The Collatz sequence starts at any number. If the number is even, it's divided by `2`. If it is odd it is multiplied by `3` and `1` is added. In any case the chain continues at this new number until the sequence reaches `1`. Question: For all starting numbers between 1 and 100, how many chains have a length greater than 15?

 ```haskell
    chain :: (Integral a) => a -> [a]  
    chain 1 = [1]  
    chain n  
        | even n =  n:chain (n `div` 2)  
        | odd n  =  n:chain (n*3 + 1)

    numLongChains :: Int  
    numLongChains = length (filter isLong (map chain [1..100]))  
        where isLong xs = length xs > 15
```

 * **Lambdas** are anonymous functions. They are defined with a `\`, followed by space 
separated parameters, and a `->` that points at the function body:

 ```haskell
    numLongChains :: Int  
    numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))  

    -- Multiple Parameters
    zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]

    -- Pattern Matching
    map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]

    -- Lambdas and currying;
    addThree :: (Num a) => a -> a -> a -> a
    -- These are equivalent
    addThree x y z = x + y + z
    addThree \x -> \y -> \z -> x + y + z

    flip' f = \x y -> f y x
```

 Sometimes lambdas are used even if that is not neccessary, like `map (\x -> x + 3) [1,6,3,2]`
 instead of more readable `map (+3) [1,6,3,2]`.

 * **Folds** take a binary function a start value and a list as parameter. The binary function is called with the accumulator and the first (or last) element from the list and produces a new accumulator. Then it's called again with this new accumulator and the next list element. Whenever you want to traverse a list to return something, chances are you want a fold.

 * **foldl** or **left fold** folds up a list from the left side.

 ```haskell
sum' :: (Num a) => [a] -> a  
sum' xs = foldl (\acc x -> acc + x) 0 xs
```

 In the beginning the binary function is called with `acc` value `0` and the first list element. The lambda function `(\acc x -> acc + x)` is the same as `(+)` and we can omit `xs` because `foo a = bar b a` can be written as `foo = bar b`:

 ```haskell
sum' :: (Num a) => [a] -> a  
sum' = foldl (+) 0 
```

 ```haskell
elem' :: (Eq a) => a -> [a] -> Bool  
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys
```

 * **foldr** does a **right fold**. Here the parameters to the binary function are flipped.

 ```haskell
map' :: (a -> b) -> [a] -> [b]  
map' f xs = foldr (\x acc -> f x : acc) [] xs 
```

 We could also use `foldl` with the function `\acc x -> acc ++ [f x]`. But `++` is much more expensive than `:`. Right folds are usually used to build up lists. Right folds also work with infinite lists whereas left folds don't.

 * **foldl1** and **foldr1** work like `foldl` and `foldr` but use the first (or last) list element as starting value. They don't work with emtpy lists.

 ```haskell
sum = foldl1 (+)
```
 
 * Fold examples

 ```haskell
    maximum' :: (Ord a) => [a] -> a  
    maximum' = foldr1 (\x acc -> if x > acc then x else acc)  

    reverse' :: [a] -> [a]  
    reverse' = foldl (\acc x -> x : acc) []  
    -- alternative
    reverse' = foldl (flip (:)) []
  
    product' :: (Num a) => [a] -> a  
    product' = foldr1 (*)  
  
    filter' :: (a -> Bool) -> [a] -> [a]  
    filter' p = foldr (\x acc -> if p x then x : acc else acc) []  
  
    head' :: [a] -> a  
    head' = foldr1 (\x _ -> x)  
  
    last' :: [a] -> a  
    last' = foldl1 (\_ x -> x)
```

 * **scanl** and **scanr** are like `foldl` and `foldr` but they also give all intermediate results back

 ```haskell
scanl (+) 0 [3,5,2,1]    ([0,3,8,10,11])
scanr (+) 0 [3,5,2,1]    ([11,8,3,1,0])
scanl1 (\acc x -> if x > acc then x else acc) [3,2,9,2,1]    ([3,3,9,9,9])
scanl (flip (:)) [] [3,2,1]     ([[],[3],[2,3],[1,2,3]])
```

 * *How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?*

 ```haskell
sqrtSums :: Int  
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1
```

 * The **function application** function **$** looks like

 ```haskell
($) :: (a -> b) -> a -> b  
f $ x = f x
```

 It has lowest precedencde and thus can often be used instead of parentheses: `sum $ map sqrt [1..130]` instead of `sum (map sqrt [1..130])` or `sum $ filter (> 10) $ map (*2) [2..10]` instead of `sum (filter (> 10) (map (*2) [2..10]))`.

 It also allows to map function application to a list of functions like `map ($ 3) [(4+), (10*), (^2), sqrt]`.

 * **Function composition** is done with the **.** function. If called with two functions `f` and `g` it returns a new function. This function is like calling `f` with argument `x` and then `g` with that result: `f( g(x) )`.

 ```haskell
(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x)
```

 ```haskell
map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
sum (replicate 5 (max 6.7 8.9))
replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
-- same with function composition
map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
map (negate . sum . tail) [[1..5],[3..6],[1..7]]
sum . replicate 5 . max 6.7 $ 8.9
replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]
```

 * A common use case for function composition is defining function in so called *point free* style. It's when we write `sum' = foldl (+) 0` instead of `sum' xs = foldl (+) 0 xs` (omitting the `xs`). 

 ```haskell
fn x = ceiling (negate (tan (cos (max 50 x))))
-- in point free style
fn = ceiling . negate . tan . cos . max 50
```
