module Tree where

-- it means that Tree of type a consists of Leaf node or a Node containing one value of type a with exactly two subtrees of type a
data Tree a = Leaf | Node a (Tree a) (Tree a)
    deriving (Show, Eq)

testTree :: Tree Int
testTree = Node 7 (Node 3 (Node 1 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 19 (Node 16 Leaf Leaf) (Node 41 Leaf Leaf))

-- check if tree is empty
empty :: Tree a -> Bool
empty Leaf  = True
empty _     = False

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

-- search value in tree
search :: (Ord a) => Tree a -> a -> Bool
search Leaf x = False
search (Node val lt rt) x 
    | x == val = True
    | x > val = search rt x
    | x < val = search lt x

leaves :: Tree a -> Int
leaves Leaf                 = 0
leaves (Node _ Leaf Leaf)   = 1
leaves (Node _ lt rt)       = leaves lt + leaves rt

nnodes :: Tree a -> Int
nnodes Leaf             = 0
nnodes (Node _ lt rt)   = 1 + nnodes lt + nnodes rt