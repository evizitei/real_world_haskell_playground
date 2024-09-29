class BasicEq a where
    isEqual :: a -> a -> Bool
    isEqual left right = not (isNotEqual left right)
    isNotEqual :: a -> a -> Bool
    isNotEqual left right = not (isEqual left right)

instance BasicEq Bool where
    isEqual True True = True
    isEqual False False = True
    isEqual _ _ = False
    isNotEqual a b = not (isEqual a b)