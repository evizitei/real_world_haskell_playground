data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

data WeakTree a = WeakNode a (Maybe (WeakTree a)) (Maybe (WeakTree a))
                deriving (Show)