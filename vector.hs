import System.Console.Terminfo (Color(Yellow))
import Data.Sequence (Seq(Empty))
data Cartesian = Cartesian Double Double
                  deriving (Eq, Show)
data Polar = Polar Double Double
                deriving (Eq, Show)

data RainbowColor = Red | Orange | Yellow | Green | Blue | Indigo | Violet
                    deriving (Eq, Show)

type Vector  = (Double, Double)
data Shape = Circle Vector Double
            | Poly [Vector]

myNot True = False
myNot a = True

sumList (x:xs) = x + sumList xs
sumList [] = 0

third (a, b, c) = c

data MyList a = MyCons a (MyList a)
                | MyNil
                deriving (Show)

fromMyList (MyCons a b) = a : fromMyList b
fromMyList MyNil = []

data Tree a = Node a (Tree a) (Tree a)
            | EmptyTree
            deriving (Show)

tidySecond (_:x:_) = Just x
tidySecond _ = Nothing

lend amount balance = let reserve = 100
                          newBalance = balance - amount
                       in if newBalance < reserve
                          then Nothing
                          else Just newBalance

pluralise word counts = map plural counts
    where plural 0 = "no " ++ word ++ "s"
          plural 1 = "one " ++ word
          plural n = show n ++ " " ++ word ++ "s"

myLength (x:xs) = 1 + myLength xs
myLength [] = 0