module Prettify (Doc, (<->), punctuate) where

import Jason
import Numeric (showHex)
import Data.Bits (shiftR, (.&.))
import Data.Char (ord)

data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
           deriving (Show,Eq)

(<->) :: Doc -> Doc -> Doc
Empty <-> b = b
a <-> Empty = a
a <-> b = a `Concat` b

(</>) :: Doc -> Doc -> Doc
x </> y = x <-> softline <-> y

empty :: Doc
empty = Empty

char :: Char -> Doc
char c = Char c

text :: String -> Doc
text "" = Empty
text s = Text s

double :: Double -> Doc
double d = text (show d)

line :: Doc
line = Line

softline :: Doc
softline = group line

group :: Doc -> Doc
group x = flatten x `Union` x

flatten :: Doc -> Doc
flatten (x `Concat` y) = flatten x `Concat` flatten y
flatten Line = Char ' '
flatten (x `Union` _) = flatten x
flatten other = other

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p [] = []
punctuate p [d] = [d]
punctuate p (d:ds) = (d <-> p)  : punctuate p ds

foldDoc :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
foldDoc func = foldr func empty

hcat :: [Doc] -> Doc
hcat = foldDoc (<->)

fsep :: [Doc] -> Doc
fsep = foldDoc (</>)