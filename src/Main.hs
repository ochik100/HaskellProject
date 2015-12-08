-- | Main entry point to the application.
module Main where

import Group
import ZGroup

-- | The main entry point.
main :: IO ()
main = do
    putStrLn $ show (createZGroup 5)
    putStrLn $ show (createZxZGroup 5 5)
    putStrLn $ show (prettyPrint 5)
