module ZxZGroup where

import ZGroup
import Data.Matrix

createZxZGroup :: Int -> Int -> [(Int, Int)]
createZxZGroup 0 0 = []
createZxZGroup 1 1 = [(0, 0)]
createZxZGroup 1 y = [(0, y) | y<-[0..y-1]]
createZxZGroup x 1 = [(x, 0) | x<-[0..x-1]]
createZxZGroup x y = [(x, y) | x<-[0..x-1], y<-[0..y-1]]

createZxZGroupList :: Int -> Int -> [(Int, Int)] -> [[(Int, Int)]]
createZxZGroupList _ _ [] = []
createZxZGroupList a b (x:xs) = [map (operator a b x) (axb)] ++ createZxZGroupList a b xs
    where axb = createZxZGroup a b

operator :: Int -> Int -> (Int, Int) -> (Int, Int) -> (Int, Int)
operator a b first second = (x, y) where
    x = modulus a (fst first) (fst second)
    y = modulus b (snd first) (snd second)

createZxZGroupTable :: Int -> Int -> Matrix (Int, Int)
createZxZGroupTable a b = fromLists (createZxZGroupList a b axb)
    where axb = createZxZGroup a b

findOrderZxZGroup :: [(Int, Int)] -> Maybe Int 
findOrderZxZGroup [] = Nothing
findOrderZxZGroup zxz = Just (length zxz)