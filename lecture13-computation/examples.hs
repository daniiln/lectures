import Prelude hiding (Maybe(..), Either(..))

import Data.Complex
import System.Random

--
-- Abstracting map
--
data Maybe a = Nothing
             | Just a

mapMaybe :: (a -> b) -> Maybe a -> Maybe b
mapMaybe _ Nothing  = Nothing
mapMaybe f (Just x) = Just (f x)

data Tree a = EmptyTree
            | Node a (Tree a) (Tree a)
  deriving (Show, Read, Eq)

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree _ EmptyTree    = EmptyTree
mapTree f (Node x l r) = Node (f x) (mapTree f l) (mapTree f r)

-- Functor instance for Maybe

-- instance Functor Maybe where

data Either a b = Left a
                | Right b

-- Functor instance for Either
-- check lecture! 
instance Functor (Either a) where
    fmap _ (Left x)  = Left x
    fmap f (Right x) = Right (f x)

--
-- Abstracting over computation
--

--
-- Debuggable functions
--
f', g' :: Float -> (Float, String)
f' x = (x + 1, "Called f")
g' x = (x * 2, "Called g")

g'Thenf' :: Float -> (Float, String)
g'Thenf' x = let (y, s1) = g' x
                 (z, s2) = f' y
             in
               (z, s1++s2)

{-
bind :: (Float, String) -> (Float -> (Float, String)) -> (Float, String)

unit :: Float -> (Float, String)

lift :: (Float -> Float) -> Float -> (Float, String)
-}

--
-- Multivalue functions
--
sqrt', cbrt' :: Complex Float -> [Complex Float]
cbrt' = rootC 3
sqrt' = rootC 2

rootC :: Float -> Complex Float -> [Complex Float]
rootC n (a :+ b) =
    zipWith (:+) r i
  where
    r   = map (* (mod ** (1/n) )) $ map cos $ map arg [0..n-1]
    i   = map (* (mod ** (1/n) )) $ map sin $ map arg [0..n-1]
    arg = ( * (2*pi / n) )
    mod = sqrt (a*a + b*b)

{-
bind :: [Complex Float] -> (Complex Float -> [Complex Float]) -> [Complex Float]

unit :: Complex Float -> [Complex Float]

sixthroot :: Complex Float -> [Complex Float]
sixthroot x = unit x `bind` sqrt' `bind` cbrt'
-}

--
-- Random functions
--

{-
bind :: (StdGen -> (a, StdGen))
     -> (a -> StdGen -> (b, StdGen))
     -> StdGen -> (b, StdGen)

unit :: a -> (StdGen -> (a, StdGen))

lift :: (a -> b) -> a -> StdGen -> (b, StdGen)
-}
