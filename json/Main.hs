module Main (main) where

import Jason
import Prettify (compact, pretty) 
import PrettyJSON (renderJValue)

renderJObj = compact . renderJValue
prettyJobj = (pretty 120) . renderJValue

main :: IO ()
main = let jdoc = JObject [("foo", JNumber 1), ("bar", JBool False), ("baz", JString "asdf")]
  in putStrLn ((renderJObj jdoc) ++ "\n\n" ++ (prettyJobj jdoc ))