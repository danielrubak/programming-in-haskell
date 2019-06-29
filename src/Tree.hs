module Tree where

-- it means that Tree of type a consists of Leaf node or a Node containing one value of type a with exactly two subtrees of type a
data Tree a = Node {
    value::a,
    leftTree::(Tree a),
    rightTree::(Tree a)
} | Leaf

instance (Show a) => Show (Tree a) where
    show Leaf = "-"
    show (Node val lt rt) = show val ++ " (" ++ show lt ++ ") (" ++ show rt ++ ")"

instance Eq a => Eq (Tree a) where
    (==) Leaf Leaf = True
    (==) Leaf (Node _ _ _) = False
    (==) (Node _ _ _) Leaf = False
    (==) (Node v lt rt) (Node v' lt' rt') = v == v' && lt == lt' && rt == rt' 

instance Functor Tree where
    fmap _ Leaf = Leaf
    fmap fcn (Node v lt rt) = Node (fcn v) (fmap fcn lt) (fmap fcn rt)

instance Applicative Tree where
    pure v = (Node v Leaf Leaf)
    _ <*> Leaf = Leaf
    Leaf <*> _ = Leaf
    (Node f lt rt) <*> (Node v lt' rt') = (Node (f v) (lt <*> lt') (rt <*> rt'))

-- trees definitions for testing
testTree :: Tree Int
testTree = Node 7 (Node 3 (Node 1 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 19 (Node 16 Leaf Leaf) (Node 41 Leaf Leaf))

emptyTree :: Tree Int
emptyTree = Leaf

binaryTree :: Tree Int
binaryTree = Node 18 (Node 15 (Node 40 Leaf Leaf) (Node 50 Leaf Leaf)) (Node 30 (Node 100 Leaf Leaf) (Node 40 Leaf Leaf))

unbalancedTree :: Tree Int
unbalancedTree = Node 2 Leaf (Node 4 Leaf (Node 6 Leaf (Node 8 Leaf Leaf)))

testTree2 :: Tree Int
testTree2 = Node 5 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 18 Leaf (Node 21 (Node 19 Leaf Leaf) (Node 25 Leaf Leaf)))

-- insert value
insert :: (Ord a) => Tree a -> a -> Tree a
insert Leaf new_el = 
    Node new_el Leaf Leaf

-- rt - right tree
-- lt - left tree
-- val - value for current Node
-- x - value to insert to the tree
insert (Node val lt rt) x 
    | x == val = Node val lt rt
    | x < val = Node val (insert lt x) rt
    | x > val = Node val rt (insert rt x)

-- check if tree is empty
empty :: Tree a -> Bool
empty Leaf  = True
empty _     = False

-- check if tree is binary tree
isBinary :: Tree a -> Bool
isBinary Leaf = True
isBinary (Node _ Leaf Leaf) = True
isBinary (Node _ Leaf _) = False
isBinary (Node _ _ Leaf) = False
isBinary (Node _ lt rt) = isBinary lt && isBinary rt

-- check if element is in a tree
search :: (Ord a) => Tree a -> a -> Bool
search Leaf x = False
search (Node val lt rt) x 
    | x == val = True
    | x > val = search rt x
    | x < val = search lt x

-- find height of tree
height :: Tree a -> Int
height Leaf = 0
height (Node _ lt rt) = 1 + max (height lt) (height rt)

-- check if tree is balanced
isBalanced :: Tree a -> Bool
isBalanced Leaf = True
isBalanced (Node _ lt rt)
    | abs (height lt - height rt) <= 1 = True
    | otherwise = False

-- traversing functions, for example VLR means: value of current node -> values of left tree -> values of right tree
vlr :: Tree a -> [a]
vlr Leaf = []
vlr (Node val lt rt) = [val] ++ vlr lt ++ vlr rt

lvr :: Tree a -> [a]
lvr Leaf = []
lvr (Node val lt rt) = lvr lt ++ [val] ++ lvr rt

lrv :: Tree a -> [a]
lrv Leaf = []
lrv (Node val lt rt) = lrv lt ++ lrv rt ++ [val]

vrl :: Tree a -> [a]
vrl Leaf = []
vrl (Node val lt rt) = [val] ++ vrl rt ++ vrl lt

rvl :: Tree a -> [a]
rvl Leaf = []
rvl (Node val lt rt) = rvl rt ++ [val] ++ rvl lt

rlv :: Tree a -> [a]
rlv Leaf = []
rlv (Node val lt rt) = rlv rt ++ rlv lt ++ [val]

-- parse tree to string representation
toString :: (Show a) => Tree a -> String
toString Leaf = ""
toString (Node val Leaf Leaf) = show val
toString (Node val left right) =
    show val ++ " (" ++ toString left ++ ", " ++ toString right ++ ")"

-- count leafs of tree
leaves :: Tree a -> Int
leaves Leaf                 = 0
leaves (Node _ Leaf Leaf)   = 1
leaves (Node _ lt rt)       = leaves lt + leaves rt

-- count nodes of tree
nnodes :: Tree a -> Int
nnodes Leaf             = 0
nnodes (Node _ lt rt)   = 1 + nnodes lt + nnodes rt

-- sum values in all nodes
nsum :: (Num a) => Tree a -> a
nsum Leaf = 0
nsum (Node val lt rt) = val + nsum lt + nsum rt

-- equivalent for map function for Tree
tmap :: (a -> b) -> Tree a -> Tree b
tmap fcn Leaf = Leaf
tmap fcn (Node val lt rt) = Node (fcn val) (tmap fcn lt) (tmap fcn rt)