module Logger (Logger, Log, runLogger, record) where

type Log = [String]

newtype Logger a = Logger { execLogger :: (a, Log)}

-- this kind of function is generally the only
-- way to escape once a monad chain has been started.
-- think "runState" or "evalState".
runLogger :: Logger a -> (a, Log)
runLogger = execLogger

record :: String -> Logger ()
record s = Logger ((), [s])

instance Monad Logger where
    return a = Logger (a, [])
    (>>=) :: Logger a -> (a -> Logger b) -> Logger b
    m >>= k = let (a, w) = execLogger m
                  n = k a
                  (b, x) = execLogger n
              in Logger (b, w ++ x)