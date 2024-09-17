import Jason

data Doc = ToBeDefined
    deriving (Show)

pointyString :: String -> Doc
pointyString s = enclose '"' '"' (hcat (map oneChar s))

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined

char :: Char -> Doc
char c = undefined

enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <-> x <-> char right

(<->) :: Doc -> Doc -> Doc
a <-> b = undefined

hcat :: [Doc] -> Doc
hcat xs = undefined

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
    Just r -> text r
    Nothing | mustEscape c -> hexEscape c
            | otherwise -> char c

simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
    where ch a b = (a, ['\\', b])
