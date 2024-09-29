main = do
        putStrLn "Please Enter A Double:"
        inputStr <- getLine
        let inpDouble = (read inputStr)::Double
        putStrLn ("Twice " ++ show inpDouble ++ " is " ++ show (inpDouble * 2))