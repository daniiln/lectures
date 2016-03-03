Skip to content
This repository  
Search
Pull requests
Issues
Gist
 @daniiln
 Watch 1
  Star 0
 Fork 3 DrexelCS360/lectures
 Code  Issues 0  Pull requests 0  Wiki  Pulse  Graphs
Branch: master Find file Copy pathlectures/lecture16-regex/Set.hs
80e4cd1  7 hours ago
@mainland mainland Add lecture 16 examples.
1 contributor
RawBlameHistory    123 lines (96 sloc)  3.11 KB
module Set (
    Set,

    empty,
    isEmpty,

    singleton,

    size,

    toList,
    fromList,

    split,

    member,
    insert,
    delete,
    union,
    intersection,
    difference,

    isSubsetOf,

    mapSet,
    filterSet
  ) where

import Data.List (sort)

-- We represent sets as *ordered* lists
data Set a = Set [a]
  deriving (Eq, Ord, Show, Read)

empty :: Set a
empty = Set []

isEmpty :: Set a -> Bool
isEmpty (Set []) = True
isEmpty _        = False

singleton :: a -> Set a
singleton x = Set [x] 

size :: Set a -> Int
size (Set xs) = length xs

toList :: Set a -> [a]
toList (Set xs) = xs

fromList :: Ord a => [a] -> Set a
{-fromList xs = Set (sort xs)-}
{-fromList = Set . nb . sort -}
fromList xs = (Set . nb . sort) xs
    where 
        -- Invariant: input is sorted
        nub :: Eq a => [a] -> [a]
        nub []                   = []
        nub [x]                  = [x]
        nub (X:y:ys) | x == y    = nub (y:ys)
                     | otherwise = x : nub (y:ys)

split :: Set a -> (a, Set a)
split (Set [])     = error "Cannot split empty set"
split (Set (x:xs)) = (x, Set xs)

member :: Ord a => a -> Set a -> Bool
member x (Set ys) = mem x ys
    where 
        mem _ []                 = False
        mem x (y:ys) | x < y  ............
                     | x == y    = True
                     | otherwise = mem x ys

insert :: Ord a => a -> Set a -> Set a
insert x0 (Set ys0) = Set (ins x0 ys0)
  where
    ins :: Ord a => a -> [a] -> [a]
    ins x []                 = [x]
    ins x (y:ys) | x < y     = x : (y : ys)
                 | x == y    = y : ys
                 | otherwise = y : ins x ys

delete :: Ord a => a -> Set a -> Set a
delete x0 (Set ys0) = Set (del x0 ys0)
  where
    del :: Ord a => a -> [a] -> [a]
    del _ []                 = []
    del x (y:ys) | x < y     = y : ys
                 | x == y    = ys
                 | otherwise = y : del x ys

union :: Ord a => Set a -> Set a -> Set a
union (Set xs0) (Set ys0) = Set (uni xs0 ys0)
  where
    uni :: Ord a => [a] -> [a] -> [a]
    uni []     ys                 = ys
    uni xs     []                 = xs
    uni (x:xs) (y:ys) | x < y     = x : uni xs (y:ys)
                      | x == y    = x : uni xs ys
                      | otherwise = y : uni (x:xs) ys

intersection :: Ord a => Set a -> Set a -> Set a
intersection (Set xs0) (Set ys0) = Set (int xs0 ys0)
  where
    int :: Ord a => [a] -> [a] -> [a]
    int []     _                  = []
    int _      []                 = []
    int (x:xs) (y:ys) | x < y     = int xs (y:ys)
                      | x == y    = x : int xs ys
                      | otherwise = int (x:xs) ys

difference ::  Ord a => Set a -> Set a -> Set a
difference (Set xs0) (Set ys0) = Set (diff xs0 ys0)
  where
    diff :: Ord a => [a] -> [a] -> [a]
    diff []     _                  = []
    diff xs     []                 = xs
    diff (x:xs) (y:ys) | x < y     = x : diff xs (y:ys)
                       | x == y    = diff xs ys
                       | otherwise = diff (x:xs) ys

isSubsetOf :: Ord a => Set a -> Set a -> Bool
isSubsetOf (Set xs0) (Set ys0) = subs xs0 ys0
  where
    subs :: Ord a => [a] -> [a] -> Bool
    subs []     _                  = True
    subs _      []                 = False
    subs (x:xs) (y:ys) | x < y     = False
                       | x == y    = subs xs ys
                       | otherwise = subs (x:xs) ys

mapSet :: Ord b => (a -> b) -> Set a -> Set b
mapSet f (Set xs) = fromList (map f xs)

filterSet :: Ord a => (a -> Bool) -> Set a -> Set a
filterSet f (Set xs) = Set (filter f xs)
Status API Training Shop Blog About Pricing
© 2016 GitHub, Inc. Terms Privacy Security Contact Help
