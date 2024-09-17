import Data.Char (digitToInt)

parseInt :: Int -> String -> Int
parseInt acc [] = acc
parseInt acc (x:xs) = let acc' = acc * 10 + (digitToInt x)
                      in parseInt acc' xs

asInt xs = parseInt 0 xs


asIntFold :: Foldable t => t Char -> Int
asIntFold xs = let (value, power) = foldr step (0,0) xs
  in value
  where step x (v, pow) = let val' = v + (digitToInt x) * 10 ^ pow
                          in (val', pow + 1)
