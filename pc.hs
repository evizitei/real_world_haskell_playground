punctuateChar :: Char -> [Char] -> [Char]
punctuateChar p [] = []
punctuateChar p [c] = [c]
punctuateChar p (firstChar:restOfString) = firstChar : p : punctuateChar p restOfString


 