splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith pred xs = let (pre, suf) = break pred xs
                    in pre : splitWith pred (dropWhile pred suf)