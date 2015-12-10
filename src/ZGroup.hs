module ZGroup where

import Group
import Data.Matrix
import Data.List
import Data.Tuple

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

createZxZGroup :: Int -> Int -> [(Int, Int)]
createZxZGroup 0 0 = [(0, 0)]
createZxZGroup 0 y = [(0, y) | y<-[0..y-1]]
createZxZGroup x 0 = [(x, 0) | x<-[0..x-1]]
createZxZGroup x y = [(x, y) | x<-[0..x-1], y<-[0..y-1]]

--testing :: Int -> Int -> [[(Int, Int)]]
--testing a b = [map (operator a b val) (axb)] ++ [map (operator a b (next axb)) (axb)]
--    where val = (0, 0)
--          axb = createZxZGroup a b
--          next value = head value

createZxZGroupList :: Int -> Int -> [(Int, Int)] -> [[(Int, Int)]]
createZxZGroupList _ _ [] = []
createZxZGroupList a b (x:xs) = [map (operator a b x) (axb)] ++ createZxZGroupList a b xs
    where axb = createZxZGroup a b


operator :: Int -> Int -> (Int, Int) -> (Int, Int) -> (Int, Int)
operator a b first second = (x, y) where
    x = modulus a (fst first) (fst second)
    y = modulus b (snd first) (snd second)

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

findCyclicGenerators :: Int -> [Int]
findCyclicGenerators n = elemIndices True (map (equals group) (findSubgroupsZGroup group))
    where group = createZGroup n

findNonCyclicGenerators :: Int -> [Int]
findNonCyclicGenerators n = elemIndices False (map (equals group) (findSubgroupsZGroup group))
    where group = createZGroup n

equals :: [Int] -> [Int] -> Bool
equals group subgroups = if group == sort subgroups
                            then True
                            else False

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
