import Data.Char(toUpper)

main = interact (map toUpper)

data MyMaybe a = Concrete a | Empty 

toOutput :: MyMaybe a -> String
toOutput (Concrete x) = "Concrete " ++ show x
toOutput Empty = ""

