module Prettify (
    Doc, (<->), punctuate, compact, pretty, fill,
    hcat, fsep, text, double, char
    ) where

import Jason
import Numeric (showHex)
import Data.Bits (shiftR, (.&.))
import Data.Char (ord)
import Language.Haskell.TH (newtypeD_doc)

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

compact :: Doc -> String
compact x = transform [x]
  where transform [] = ""
        transform (d:ds) = 
            case d of
                Empty -> transform ds
                Char c -> c : transform ds
                Text s -> s ++ transform ds
                Line -> '\n' : transform ds
                a `Concat` b -> transform (a:b:ds)
                _ `Union` b -> transform (b:ds)

pretty :: Int -> Doc -> String
pretty width x = best 0 [x]
  where best col (d:ds) =
            case d of
                Empty -> best col ds
                Char c -> c : best (col + 1) ds
                Text s -> s ++ best (col + length s) ds
                Line -> '\n' : best 0 ds
                a `Concat` b -> best col (a:b:ds)
                a `Union` b -> nicest col (best col (a:ds)) (best col (b:ds))
        best _ _ = ""
        nicest col a b | (width - least) `fits` a = a
                       | otherwise = b
            where least = min width col

fits :: Int -> String -> Bool
w `fits` _ | w < 0 = False
w `fits` "" = True
w `fits` ('\n':_) = True
w `fits` (c:cs) = (w-1) `fits` cs

fill :: Int -> Doc -> Doc
fill width doc = processNode 0 [doc]
    where processNode col [] = Empty
          processNode col (d:ds) = 
            case d of
                Empty -> Empty <-> processNode col ds
                Char c -> Char c <-> processNode (col + 1) ds
                Text s -> Text s <-> processNode (col + length s) ds
                Line -> fillLine col width <-> processNode 0 ds
                a `Concat` b -> processNode col (a:b:ds)
                a `Union` b -> processNode col (b:ds)
          fillLine currentLength targetWidth | currentLength >= targetWidth = Line
                                             | otherwise = Text (replicate (targetWidth - currentLength) ' ') <-> Line

nest :: Int -> Doc -> Doc
nest indentAmount doc = processNode 0 0 [doc]
  where processNode _ _ [] = Empty
        processNode col indentLevel (d:ds) =
          case d of
            Empty -> Empty <-> processNode col indentLevel ds
            Char c -> Char c <-> processNode (col + 1) (checkIndentLevel indentLevel c) ds
            Text s -> Text s <-> processNode (col + length s) indentLevel ds
            Line -> Line <-> Text (indentString indentAmount indentLevel) <-> processNode (indentAmount * indentLevel) indentLevel ds
            a `Concat` b -> processNode col indentLevel (a:b:ds)
            a `Union` b -> processNode col indentLevel (b:ds)
        checkIndentLevel :: Int -> Char -> Int
        checkIndentLevel curLevel curChar | curChar == '[' = curLevel + 1
                                          | curChar == '{' = curLevel + 1
                                          | curChar == ']' = curLevel - 1
                                          | curChar == '}' = curLevel - 1
                                          | otherwise = curLevel
        indentString :: Int -> Int -> String
        indentString _ 0 = ""
        indentString indentSize indentLevel = replicate (indentSize * indentLevel) ' '