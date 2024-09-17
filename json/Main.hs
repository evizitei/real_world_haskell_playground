module Main (main) where

import Jason
import PutJSON (putJVal)

main :: IO ()
main = putJVal (JObject [("foo", JNumber 1), ("bar", JBool False), ("baz", JString "asdf")])