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

findSubgroupsZGroup :: [Int] -> [[Int]]
findSubgroupsZGroup [] = [[]]
findSubgroupsZGroup zgroup = map (findSub n) zgroup where
    n = length zgroup

findSub :: Int -> Int -> [Int]
findSub n 0 = [0]
findSub n gen = [0] ++ [value] ++ next value where
    value = modulus n gen 0
    next val = if (modulus n gen val) == 0
                then []
                else [modulus n gen val] ++ next (modulus n gen val)

modulus :: Int -> Int -> Int -> Int
modulus n x y = (x+y) `mod` n

--findCyclicGenerators :: I

findOrderZxZGroup :: [[Int]] -> Maybe Int 
findOrderZxZGroup [[]] = Nothing
findOrderZxZGroup zxz = Just (length zxz)

findOrderGroupTable :: [[Int]] -> Maybe Int
findOrderGroupTable [[]] = Just 0
findOrderGroupTable group = if isGroup group
                    then Just (length group)
                    else Nothing

findOrderZGroup :: [Int] -> Int
findOrderZGroup [] = 0
findOrderZGroup [0] = 1
findOrderZGroup zgroup = length zgroup

findIndex :: [Int] -> [Int] -> Int
findIndex group subgroup = (findOrderZGroup group) `div` (findOrderZGroup (subgroup))
