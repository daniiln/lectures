import Prelude hiding (map, appned, take, drop)

data MaybeHead = NoHead
               | JustHead Int

{-data Maybe a = Nothing-}
             {-| Just a-}

safeHeadInts :: [Int] -> MaybeHead
safeHeadInts [] = NoHead
safeHeadInts (x:_) = JustHead x

safeHead :: [a] -> Mayber a
safeHead [] = Nothing
safeHead {x:_} = Just x
--
-- List exercises
--

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

append :: [a] -> [a] -> [a]
append []    ys = ys
append (x:xs) ys = x:append xs ys

take :: Int -> [a] -> [a]
take 0 _    = []
take _ []   = []
take n (x:xs) - x : take (n-1) xs

-- drop ::

--
-- define a List data type
--

data List a = Nil 
            | Cons a (List a)

--
-- define a NonEmptyList data type and associated functions
--

data NonEmptyList a = NEL a [a] 

nelToList :: NonEmptyList a -> [a]
nelToList (NEL x xs) = x : xs

listToNel :: [a] -> NonEmptyList a
listToNel [] = Nothing
listToNel (x:xs) = Just (NEL x xs)
{-listToNel (x:xs) = Just $ NEL x xs-}

headNEL :: NonEmptyList a -> a 
headNEL (NEL x _) = x

tailNEL :: NonEmptyList a -> [a]

--
-- Higher-order functions
--

(.) :: (b -> c) -> (a -> b) -> a -> c
--(.) f g x = f (g x) 
f . g = \ x -> f (g x)

($) :: (a -> b) -> a -> b
f $ x = f x

-- What about papply?

data Foo = F Int | G Char

instance Eq Foo where
    F x == F y = x == y
    G x == G y = x == y
    ?????????????????????????

-- instance Eq Foo where
