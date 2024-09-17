groupByFoldl :: (a -> a -> Bool) -> [a] -> [[a]]
groupByFoldl _ [] = []
groupByFoldl predicate xs = foldl step [] xs
  where step [] newVal = [[newVal]]
        step listOfLists newVal | predicate (head (last listOfLists)) newVal = init listOfLists ++ [last listOfLists ++ [newVal]]
                                | otherwise = listOfLists ++ [[newVal]]

groupByFoldr :: (a -> a -> Bool) -> [a] -> [[a]]
groupByFoldr _ [] = []
groupByFoldr predicate xs = foldr step [] xs
    where step newVal [] = [[newVal]]
          step newVal (curList:otherLists) | predicate (head curList) newVal = (newVal : curList) : otherLists
                                           | otherwise = [newVal] : curList : otherLists