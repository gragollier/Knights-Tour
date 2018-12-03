module Tour
where

import Board
import Control.Parallel.Strategies

run :: Int -> Int -> [Maybe Board.Board]
run x y = parMap rseq (\(a, b) -> tour a b 1 $ Just $ Board.intialize x y) [(x, y) | x <- [0..(x-1)], y <- [0..(y-1)]]
    

tour :: Int -> Int -> Int -> Maybe Board.Board-> Maybe Board.Board
tour x y n b
    | n > Board.boardSize b               = Nothing
    | not (Board.inBounds x y b)          = Nothing
    | Board.boardElm x y b /= Board.Empty = Nothing
    | tour1 /= Nothing                    = tour1
    | tour2 /= Nothing                    = tour2
    | tour3 /= Nothing                    = tour3
    | tour4 /= Nothing                    = tour4
    | tour5 /= Nothing                    = tour5
    | tour6 /= Nothing                    = tour6
    | tour7 /= Nothing                    = tour7
    | tour8 /= Nothing                    = tour8
    | n     == Board.boardSize b          = updatedBoard
    | otherwise        = Nothing
        where   tour1 = tour (x - 1) (y + 2) (n + 1) updatedBoard
                tour2 = tour (x + 1) (y + 2) (n + 1) updatedBoard
                tour3 = tour (x - 2) (y + 1) (n + 1) updatedBoard
                tour4 = tour (x - 2) (y - 1) (n + 1) updatedBoard
                tour5 = tour (x - 1) (y - 2) (n + 1) updatedBoard
                tour6 = tour (x + 1) (y - 2) (n + 1) updatedBoard
                tour7 = tour (x + 2) (y + 1) (n + 1) updatedBoard
                tour8 = tour (x + 2) (y - 1) (n + 1) updatedBoard
                updatedBoard = update x y (Board.Visited n) b