str2message :: String -> String
str2message input = "Data: " ++ input

str2action :: String -> IO ()
str2action = putStrLn . str2message

numbers = [1..10]

main = do
    str2action "Start of program"
    mapM_ (str2action . show) numbers
    str2action "Done!"