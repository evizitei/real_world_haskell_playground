-- https://book.realworldhaskell.org/read/types-and-functions.html
add a b = a + b

myDrop :: Int -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop ((-) n 1) (tail xs)

isOdd n = mod n 2 == 1

lastButOne xs = if length xs <= 2
                then head xs
                else lastButOne (tail xs)