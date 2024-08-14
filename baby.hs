doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmalls x = if x > 100
    then x
    else doubleMe x

combineList a b = a ++ b

myCons a b = a : b

atIndex list index = list !! index

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

triangleOfLength l = [ (a,b,c) | c <- [1..l], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == l]