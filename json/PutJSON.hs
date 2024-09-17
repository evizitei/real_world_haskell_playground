module PutJSON (renderJVal, putJVal) where

import Data.List (intercalate)
import Jason

commify = intercalate ", "

tricat :: String -> String -> String -> String
tricat a b c = a ++ b ++ c

renderJVal :: JValue -> String
renderJVal (JString s) = show s
renderJVal (JNumber s) = show s
renderJVal (JBool True) = "t"
renderJVal (JBool False) = "f"
renderJVal JNull = "null"
renderJVal (JObject o) = tricat "{" (pairs o) "}"
    where pairs [] = ""
          pairs ps = commify (map renderPair ps)
          renderPair (k, v) = tricat (show k) ": " (renderJVal v)
renderJVal (JArray a) = tricat "[" (values a) "]"
    where values [] = ""
          values vs = commify (map renderJVal vs)

putJVal :: JValue -> IO ()
putJVal v = putStrLn (renderJVal v)