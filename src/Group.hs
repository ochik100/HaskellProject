module Group where

import Data.Maybe

isAssociative :: [[Int]] -> Bool
isAssociative [[]] = False
isAssociative ls = 
  and [ g (g x y) z == g x (g y z) | x <- [0..n-1], y <- [0..n-1], z <- [0..n-1]]
  where n = length ls
        g = getValue ls

getValue :: [[Int]] -> Int -> Int -> Int
getValue ls a b = ls !! a !! b

findIdentity :: [[Int]] -> Maybe Int
findIdentity ls = find 0 ls $ Group.transpose ls where
  n = length ls - 1
  find _ [] [] = Nothing
  find y xs ys = if map head xs == map head ys && map head xs == [0..n]
                 then Just y
                 else if n == y
                      then Nothing
                      else find (y+1) (map tail xs) (map tail ys)

transpose :: [[Int]] -> [[Int]]
transpose [] = []
transpose ls | (length $ head ls) == 1 = [map head ls]
             | otherwise = map head ls:(Group.transpose $ map tail ls)

checkInverses :: [[Int]] -> Maybe Int -> Bool
checkInverses ls i = 
  if not (any (==True) [(g x y == g y x) && (g y x == e) | x <- [0..n-1], y <- [0..n-1]])
    then False
    else True
  where n = length ls
        g = getValue ls
        e = getInt i 

getInt :: Maybe Int -> Int
getInt e = if isNothing e 
              then -1
              else fromJust e

isGroup :: [[Int]] -> Bool
isGroup [[]] = False
isGroup ls 
  | group <= nothing = False
  | group = True
  | group = False 
  where group = isAssociative ls && checkInverses ls e
        e = findIdentity ls
        nothing = isNothing e

isClosed :: [[Int]] -> [Int] -> Bool
isClosed [[]] [] = False
isClosed gr sg = and [elem (g x y) sg | x <- sg, y <- sg]
  where g = getValue gr

checkIdentity :: [Int] -> Maybe Int -> Bool
checkIdentity [] _ = False
checkIdentity sg i = if elem e sg
                        then True
                        else False
                      where e = getInt i 

subgroupInverse :: [[Int]] -> [Int] -> Maybe Int -> Bool
subgroupInverse _ _ Nothing = False
subgroupInverse gr sg i = if not (any (==True) [g x y == e | x <- sg, y <- sg]) 
                            then False
                            else True
                          where g = getValue gr
                                e = getInt i

isSubgroup :: [[Int]] -> [Int] -> Bool
isSubgroup gr sg = if not (isGroup gr)
                      then False
                      else if isClosed gr sg && checkIdentity sg e && subgroupInverse gr sg e
                              then True
                              else False
                    where e = findIdentity gr
