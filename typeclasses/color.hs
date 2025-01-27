data Color = Red | Green | Blue

instance Read Color where
    readsPrec _ value = 
        tryParse [("Red", Red), ("Green", Green), ("Blue", Blue)]
        where tryParse [] = []
              tryParse ((attempt, result):xs) = 
                if take (length attempt) value == attempt
                    then [(result, drop (length attempt) value)]
                    else tryParse xs


instance Show Color where
    show c = case c of
        Red -> "Red"
        Blue -> "Blue"
        Green -> "Green"