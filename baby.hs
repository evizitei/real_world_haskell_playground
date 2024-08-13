doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmalls x = if x > 100
    then x
    else doubleMe x

combineList a b = a ++ b

myCons a b = a : b

atIndex list index = list !! index