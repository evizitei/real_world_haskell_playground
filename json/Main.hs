module Main (main) where

import Jason
import Prettify (compact, pretty, fill) 
import PrettyJSON (renderJValue)

renderJObj = compact . renderJValue
prettyJobj = (pretty 120) . renderJValue
padJObj = (pretty 90) . (fill 90) . renderJValue

main :: IO ()
main = let jdoc = JObject [("foo", JNumber 1), ("bar", JBool False), ("baz", JString "asdf")]
  in putStrLn ((renderJObj jdoc) ++ "\n\n" ++ (prettyJobj jdoc ) ++ "\n\n" ++ (padJObj jdoc)) 