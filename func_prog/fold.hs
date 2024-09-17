
leftFold :: (a -> b -> a) -> a -> [b] -> a
leftFold step zero (x:xs) = leftFold step (step zero x) xs
leftFold step zero [] = zero

leftSum xs = leftFold step 0 xs
  where step acc x = acc + x