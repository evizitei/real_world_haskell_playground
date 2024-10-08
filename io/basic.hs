
name2reply :: String -> String
name2reply name = "Well hey there, " ++ name ++ "!\n" ++
    "Your name contains " ++ charcount ++ " characters."
    where charcount = show (length name)

main = do
    putStrLn "Hey! Who are you?"
    inputStr <- getLine
    let outStr = name2reply inputStr
    putStrLn outStr