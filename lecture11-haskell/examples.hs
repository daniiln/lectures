import Prelude hiding (map, filter, take, drop)

fact :: Integer -> Integer
fact n = if n == 0
         then 1
         else n * fact (n-1)

fact' :: Integer -> Integer
fact' 0 = 1
fact' n = n * fact' (n-1)

fact'' :: Integer -> Integer
fact'' n | n == 0    = 1
         | otherwise = n * fact (n-1)

add3 :: Int -> Int -> Int -> Int
add3 x y z = x + y + z

ex16 = add3 1

-- Try:
--add x = x + "String"

--
-- List operations
--

-- map :: (a -> b) -> [a] -> [b]

-- append :: [a] -> [a] -> [a]

-- take :: Int -> [a] -> [a]

-- drop :: Int -> [a] -> [a]
