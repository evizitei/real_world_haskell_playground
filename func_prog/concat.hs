myConcat :: [[a]] -> [a]
myConcat [] = []
myConcat listOfLists = foldr step [] listOfLists
  where step oneList accumulator = oneList ++ accumulator