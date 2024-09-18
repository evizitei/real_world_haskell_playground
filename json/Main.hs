module Main (main) where

import Jason
import PutJSON (putJVal)
import Prettify 

main :: IO ()
main = putJVal (JObject [("foo", JNumber 1), ("bar", JBool False), ("baz", JString "asdf")])