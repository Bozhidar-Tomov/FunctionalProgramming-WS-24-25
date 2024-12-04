{-# OPTIONS_GHC -Werror #-}
{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
{-# OPTIONS_GHC -fwarn-incomplete-uni-patterns #-}
{-# OPTIONS_GHC -fwarn-missing-signatures #-}
{-# OPTIONS_GHC -fwarn-name-shadowing #-}
{-# OPTIONS_GHC -fwarn-unused-matches #-}

import Prelude

-- convention: first pattern matching, then guards
add1 :: (Num a) => a -> a
add1 x = x + 1

add :: Int -> Int -> Int
add x y = x + y

-- >>> add 8 6
-- 14

fact :: Int -> Int
fact 0 = 1
fact x = x * fact (x - 1)

-- >>> fact 7
-- 5040

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- >>> fib 8
-- 21

myAbs :: Int -> Int
myAbs x = if x < 0 then x * (-1) else x

-- >>> myAbs (-5)
-- 5

composeInt :: (Int -> Int) -> (Int -> Int) -> (Int -> Int)
composeInt f g x = g (f x)

-- >>> (composeInt fib fact) 4   --fib(4)=3  ->  fact(3)=6
-- 6

compose :: (a -> b) -> (b -> c) -> (a -> c)
compose f g = \x -> g (f x)

myConcat :: [a] -> [a] -> [a]
myConcat [] y = y
myConcat (h : t) y = h : myConcat t y

-- >>> myConcat [1, 2, 3] [4, 5]
-- [1,2,3,4,5]

isIntPrefix :: [Int] -> [Int] -> Bool
isIntPrefix [] _y = True
isIntPrefix _x [] = False
isIntPrefix (hx : tx) (hy : ty) = hx == hy && isIntPrefix tx ty

{-
>>> isIntPrefix [1, 2] [1, 2, 3, 4]
>>> isIntPrefix [1, 2] [1, 5, 2, 3, 4]
>>> isIntPrefix [2, 3] [1, 2, 3, 4]
>>> isIntPrefix [1, 2, 3, 4] [1, 2, 3]
True
False
False
False
-} 

isPrefix :: (Eq a) => [a] -> [a] -> Bool
isPrefix [] _y = True
isPrefix _x [] = False
isPrefix (x : xs) (y : ys) = x == y && isPrefix xs ys

fRepeat :: Int -> (a -> a) -> a -> a
fRepeat 0 _ x = x
fRepeat n f x = fRepeat (n - 1) f (f x)

-- >>> fRepeat 5 add1 10
-- 15

fRepeated :: Int -> (a -> a) -> (a -> a)
fRepeated 0 _ = id
fRepeated n f = \x -> fRepeat (n - 1) f (f x)

-- >>> (fRepeated 5 add1) 10
-- 15
