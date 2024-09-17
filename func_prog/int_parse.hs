import Data.Char (digitToInt)
import Data.List (foldl')

parseInt :: Int -> String -> Int
parseInt acc [] = acc
parseInt acc (x:xs) = let acc' = acc * 10 + (digitToInt x)
                      in parseInt acc' xs

asInt xs = parseInt 0 xs


asIntFold :: [Char] -> Int
asIntFold "" = error "Empty string"
asIntFold xs = let (value, power) = foldr step (0,0) xs
  in value
  where step '-' (v, pow) = (-v, pow)
        step x (v, pow) = let val' = v + (digitToInt x) * 10 ^ pow
                          in (val', pow + 1)

asIntFoldl :: [Char] -> Int
asIntFoldl "" = error "Empty string"
asIntFoldl ('-':xs) = (-1) * asIntFoldl xs
asIntFoldl xs = foldl' step 0 xs
  where step acc x = acc * 10 + (digitToInt x)