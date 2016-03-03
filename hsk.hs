append []  ys = ys
append (x:xs) y = x : append xs ys


take :: Int -> [a] -> [a]
take 0      = []
take _ []   = []
take n (x:xs) = x : take (n-1) xs

