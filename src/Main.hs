-- | Main entry point to the application.
module Main where

import Group
import ZGroup
import ZxZGroup

-- | The main entry point.
main :: IO ()
main = do
    putStrLn $ "Group Z20 Elements:"
    putStrLn $ show (createZGroup 20)
    putStrLn $ "\nGroup Z20 Table:"
    putStrLn $ show (createZGroupTable 20)
    putStrLn $ "Verify that Z20 is a group: "
    putStrLn $ show (isGroup (createZGroupList 20))
    putStrLn $ "\nGroup Z20 Inverses:"
    putStrLn $ show (findZInverses 20)
    putStrLn $ "\nFind subgroups of Z20:"
    putStrLn $ show (findSubgroupsZGroup (createZGroup 20))
    putStrLn $ "\nFind cyclic generators of Z20:"
    putStrLn $ show (findCyclicGenerators 20)
    putStrLn $ "\nFind non-cyclic generators of Z20:"
    putStrLn $ show (findNonCyclicGenerators 20)
    putStrLn "\n--------------------"
    putStrLn $ "\nGroup Z5 Elements:"
    putStrLn $ show (createZGroup 5)
    putStrLn $ "\nGroup Z5 Table:"
    putStrLn $ show (createZGroupTable 5)
    putStrLn $ "Verify that Z5 is a group: "
    putStrLn $ show (isGroup (createZGroupList 5))
    putStrLn $ "\nGroup Z5 Inverses:"
    putStrLn $ show (findZInverses 5)
    putStrLn $ "\nFind subgroups of Z5:"
    putStrLn $ show (findSubgroupsZGroup (createZGroup 5))
    putStrLn $ "\nFind cyclic generators of Z5:"
    putStrLn $ show (findCyclicGenerators 5)
    putStrLn $ "\nFind non-cyclic generators of Z5:"
    putStrLn $ show (findNonCyclicGenerators 5)
    putStrLn "\n--------------------"
    putStrLn $ "\nGroup Z3 Elements:"
    putStrLn $ show (createZGroup 3)
    putStrLn $ "\nGroup Z3 Table:"
    putStrLn $ show (createZGroupTable 3)
    putStrLn $ "Verify that Z3 is a group: "
    putStrLn $ show (isGroup (createZGroupList 3))
    putStrLn $ "\nGroup Z3 Inverses:"
    putStrLn $ show (findZInverses 3)
    putStrLn $ "\nFind subgroups of Z3:"
    putStrLn $ show (findSubgroupsZGroup (createZGroup 3))
    putStrLn $ "\nFind cyclic generators of Z3:"
    putStrLn $ show (findCyclicGenerators 3)
    putStrLn $ "\nFind non-cyclic generators of Z3:"
    putStrLn $ show (findNonCyclicGenerators 3)
    putStrLn "\n--------------------"
    putStrLn $ "\nGroup Z5xZ3 Elements:"
    putStrLn $ show (createZxZGroup 5 3)
    putStrLn $ "\nGroup Z5xZ3 Table:"
    putStrLn $ show (createZxZGroupTable 5 3)
    putStrLn "\nGroup Z5xZ3 Inverses:"
    putStrLn $ show (findZxZInverses 5 3)