safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_:res) = Just res

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast (x:rest) = case rest of
    [] -> Just x
    _ -> safeLast rest

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit (x:rest) = case rest of
    [] -> Just []
    _ -> Just (x : init rest)