takeWhileRecurse :: (a -> Bool) -> [a] -> [a]
takeWhileRecurse _ [] = []
takeWhileRecurse predicate (x:xs) | predicate x = x : takeWhileRecurse predicate xs
                                  | otherwise = []

takeWhileFoldr :: (a -> Bool) -> [a] -> [a]
takeWhileFoldr predicate xs = foldr step [] xs
  where step x acc | predicate x = x : acc
                   | otherwise = []