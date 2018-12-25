module Tour
where

import Board
import Control.Parallel.Strategies
import Data.List

run :: Int -> Int -> [Maybe Board.Board]
run x y = parMap rseq (\(a, b) -> tour a b 1 $ Just $ Board.intialize x y) [(x, y) | x <- [0..(x-1)], y <- [0..(y-1)]]
    

tour :: Int -> Int -> Int -> Maybe Board.Board-> Maybe Board.Board
tour x y n b
    | n > Board.boardSize b               = Nothing
    | not (Board.inBounds x y b)          = Nothing
    | Board.boardElm x y b /= Board.Empty = Nothing
    | n     == Board.boardSize b          = updatedBoard
    | otherwise                           = safeHead $ filter (\e -> e /= Nothing) tours
        where   moves = [(a, b) | a <- [-2, -1, 1, 2], b <- [-2, -1, 1, 2], abs a /= abs b]
                tours = map (\(a, b) -> tour (x + a) (y + b) (n + 1) updatedBoard) moves
                updatedBoard = update x y (Board.Visited n) b


safeHead :: [Maybe a] -> Maybe a
safeHead []     = Nothing
safeHead (x:xs) = x