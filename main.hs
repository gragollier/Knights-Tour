module Main 
where

import System.Environment
import Tour

main = do
    args <- getArgs
    let (x, y) = (read $ args !! 0, read $ args !! 1) :: (Int, Int)
    putStrLn $ show $ Tour.run x y