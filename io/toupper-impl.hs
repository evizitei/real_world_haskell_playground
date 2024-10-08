import System.IO
import Data.Char(toUpper)

mainloop :: Handle -> Handle -> IO ()
mainloop inh outh = do
    atEof <- hIsEOF inh
    if atEof then return ()
    else do inpStr <- hGetLine inh
            hPutStrLn outh (map toUpper inpStr)
            mainloop inh outh

main :: IO ()
main = do
    inh <- openFile "input.txt" ReadMode
    outh <- openFile "output.txt" WriteMode
    mainloop inh outh
    hClose inh
    hClose outh