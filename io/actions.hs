str2action :: String -> IO ()
str2action input = putStrLn ("Data: " ++ input)

list2actions :: [String] -> [IO ()]
list2actions = map str2action

numbers = [1..10]

strings = map show numbers

actions = list2actions strings

printitall = runall actions

runall :: [IO ()] -> IO ()
runall [] = return ()
runall (firstAction:others) = do
    firstAction
    runall others

main = do 
    str2action "Start of program"
    printitall
    str2action "Done!"
