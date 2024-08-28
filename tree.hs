data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

data WeakTree a = WeakNode a (Maybe (WeakTree a)) (Maybe (WeakTree a))
                deriving (Show)

nodesAreSame (Node a _ _) (Node b _ _)
            | a == b = Just a
nodesAreSame _ _ = Nothing

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))

myDrop n xs = if n <= 0 || null xs
                then xs
                else myDrop (n - 1) (tail xs)

tidyDrop n xs | n <= 0 = xs
tidyDrop _ [] = []
tidyDrop n (_:xs) = tidyDrop (n - 1) xs