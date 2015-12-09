-- | Main entry point to the application.
module Main where

import Group
import ZGroup

-- | The main entry point.
main :: IO ()
main = do
    putStrLn $ show (createZGroup 10)
    --putStrLn $ show (createZxZGroup 5 5)
    --putStrLn $ show (createZGroup 6)
    putStrLn $ show (createZGroupTable 10)
    --putStrLn $ show (findSubgroupsZGroup (createZGroup 4))
    --putStrLn $ show (findSub 6 1)
    putStrLn $ show (findSubgroupsZGroup (createZGroup 10))
    putStrLn $ show (findOrderZGroup (createZGroup 10))
    putStrLn $ show (findSub 10 3)
    putStrLn $ show (findOrderZGroup (findSub 10 3))
    putStrLn $ show (findIndex (createZGroup 10) (findSub 10 3))
    putStrLn $ show (findCyclicGenerators 10)