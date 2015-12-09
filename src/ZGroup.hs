module ZGroup where

import Group
import Data.Matrix

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
findSubgroupsZGroup (x:xs) = [[x]]++[xs]

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