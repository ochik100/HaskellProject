-- | Main entry point to the application.
module Main where

import Group
import ZGroup
import ZxZGroup

-- | The main entry point.
main :: IO ()
main = do
    putStrLn $ show (createZGroup 10)
    putStrLn $ show (createZGroupList 10)
    putStrLn $ show (createZGroupTable 10)
    --putStrLn $ show (findSubgroupsZGroup (createZGroup 4))
    --putStrLn $ show (findSub 6 1)
    putStrLn $ show (findSubgroupsZGroup (createZGroup 10))
    putStrLn $ show (findOrderZGroup (createZGroup 10))
    putStrLn $ show (findSub 10 3)
    putStrLn $ show (findOrderZGroup (findSub 10 3))
    putStrLn $ show (findIndex (createZGroup 10) (findSub 10 3))
    putStrLn $ show (findCyclicGenerators 10)
    putStrLn $ show (findNonCyclicGenerators 10)
    putStrLn $ show (createZxZGroup 3 6)
    --putStrLn $ show (findSubgroupsZGroup (createZGroup 24))
    putStrLn $ show (createZxZGroupTable 3 6)
    putStrLn $ show (findZInverses 25)
    putStrLn ""
    putStrLn $ show (createZxZGroupList 2 3 (createZxZGroup 2 3))
    putStrLn $ show (createZxZGroupTable 2 3)
    putStrLn $ show (findInverseIndices (createZxZGroupList 2 3 (createZxZGroup 2 3)))
    putStrLn $ show (findZxZInverses 5 5)