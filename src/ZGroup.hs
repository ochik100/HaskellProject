module ZGroup where

import Group
import Data.Matrix
import Data.List

createZGroup :: Int -> [Int]
createZGroup 0 = []
createZGroup n = [0..n-1]

createZGroupList :: Int -> [[Int]]
createZGroupList 0 = [[]] 
createZGroupList n = next seq where
  seq = [0..n-1]--[x|x<-[0..n-1]] 
  next xs = if (tail xs ++ [head xs]) /= seq
              then [xs] ++ next (tail xs ++ [head xs])
              else [xs]

findSub :: Int -> Int -> [Int]
findSub 0 n = [0]
findSub gen n = [0] ++ [value] ++ next value where
    value = modulus n gen 0
    next val = if (modulus n gen val) == 0
                then []--[0] ++ [value]
                else [modulus n gen val] ++ next (modulus n gen val)

createZGroupTable :: Int -> Matrix Int
createZGroupTable x = fromLists (createZGroupList x)

createZxZGroup :: Int -> Int -> [[Int]]
createZxZGroup 0 0 = [[0, 0]]
createZxZGroup 0 y = [[0, y] | y<-[0..y-1]]
createZxZGroup x 0 = [[x, 0] | x<-[0..x-1]]
createZxZGroup x y = [[x, y] | x<-[0..x-1], y<-[0..y-1]]
--createZxZGroup x y = [concatDigits [x, y] | x<-[0..x-1], y<-[0..y-1]]
--    where concatDigits = foldl ((+).(*10)) 0

--createZxZGroupTable :: [[Int]]

--findSubgroupsZGroup :: [Int] -> [[Int]]
--findSubgroupsZGroup [] = [[]]
--findSubgroupsZGroup (x:xs) = [[0]]++[genSubgroup xs]
--    where genSubgroup (x:xs) = if modulus x n /= 0 
--                                then [x] ++ genSubgroup [modulus x n]
--                                else []
--         n = (length xs)+1




modulus :: Int -> Int -> Int -> Int
modulus n x y = (x+y) `mod` n

findOrderZxZGroup :: [(Int, Int)] -> Maybe Int
findOrderZxZGroup [] = Nothing
findOrderZxZGroup zxz = Just (length zxz)

findOrderGroupTable :: [[Int]] -> Maybe Int
findOrderGroupTable [[]] = Just 0
findOrderGroupTable group = if isGroup group
                    then Just (length group)
                    else Nothing

findOrderGroup :: Int -> Maybe Int
findOrderGroup 0 = Just 0
findOrderGroup n = if isGroup (createZGroupList n)
                      then Just n
                      else Nothing