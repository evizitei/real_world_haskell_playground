a `plus` b = a + b

data a `Pair` b = a `Pair` b
                    deriving (Show)

foo = Pair 1 2
bar = 3 `Pair` 4
baz = "asdf" `Pair` "qwer"