
name2reply :: String -> String
name2reply name = "Well hey there, " ++ name ++ "!\n" ++
    "Your name contains " ++ charcount ++ " characters."
    where charcount = show (length name)

main = putStrLn "Hey! Who are you?" >> getLine >>= return . name2reply >>= putStrLn