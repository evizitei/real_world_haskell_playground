module Main (main) where

import Jason
import Prettify (compact, pretty, fill, nest) 
import PrettyJSON (renderJValue)

renderJObj = compact . renderJValue
prettyJobj = (pretty 120) . renderJValue
padJObj = (pretty 90) . (fill 90) . renderJValue
nestJObj = (pretty 120) . (nest 2) . renderJValue

main :: IO ()
main = let jdoc = JObject [("foo", JNumber 1), 
                           ("bar", JBool False), 
                           ("deep", (JObject [("a", JNumber 2), ("b", JNumber 3)])),
                           ("baz", JString "asdf")]
  in putStrLn ((renderJObj jdoc) ++ "\n\n" ++ (prettyJobj jdoc ) ++ "\n\n" ++ (padJObj jdoc)) 