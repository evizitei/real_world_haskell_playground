module Main (main) where

import Jason

main :: IO ()
main = print (getString (JObject [("foo", JNumber 1), ("bar", JBool False)]))