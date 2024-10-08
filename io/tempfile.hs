import System.IO
import System.Directory(getTemporaryDirectory, removeFile)
import Control.Exception(finally, catch, SomeException)

main :: IO ()
main = withTempFile "mytemp.txt" myAction

myAction :: FilePath -> Handle -> IO ()
myAction tempPath tempHandle = 
    do
        putStrLn "Welcome to tempfile.hs!"
        putStrLn $ "I have a temp file at " ++ tempPath
        pos <- hTell tempHandle
        putStrLn $ "First I'm at position " ++ show pos
        let tempData = show [1..100]
        putStrLn $ "Writing a line with " ++ show (length tempData) ++ " bytes. " ++ tempData
        hPutStrLn tempHandle tempData
        pos <- hTell tempHandle
        putStrLn $ "After writing, new pos is " ++ show pos
        putStrLn "File contenst -> " 
        hSeek tempHandle AbsoluteSeek 0
        c <- hGetContents tempHandle
        putStrLn c
        putStrLn "Which could be expressed as this literal: "
        print c

withTempFile ::  Show a => String -> (FilePath -> Handle -> IO a) -> IO a
withTempFile pattern func = do
    tempdir <- catch (getTemporaryDirectory) (\(_ :: SomeException) -> return ".")
    (tempfile, temphandle) <- openTempFile tempdir pattern
    finally (func tempfile temphandle) (do 
        hClose temphandle
        removeFile tempfile
        )