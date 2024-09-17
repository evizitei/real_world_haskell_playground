mysum :: [Int] -> Int
mysum [] = 0
mysum xs = helper 0 xs
  where helper acc (x:xs) = helper (acc + x) xs
        helper acc [] = acc