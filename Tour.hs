module Tour
where

import Board

run :: Int -> Int -> [Maybe Board.Board]
run x y = map (\(a, b) -> tour a b 1 $ Just $ Board.intialize x y) [(x, y) | x <- [0..(x-1)], y <- [0..(y-1)]]
    

tour :: Int -> Int -> Int -> Maybe Board.Board-> Maybe Board.Board
tour x y n hist
    | n > Board.boardSize hist                 = Nothing
    | not (Board.inBounds x y hist)            = Nothing
    | Board.boardElm x y hist /= Board.Empty   = Nothing
    | tour1 /= Nothing                         = tour1
    | tour2 /= Nothing                         = tour2
    | tour3 /= Nothing                         = tour3
    | tour4 /= Nothing                         = tour4
    | tour5 /= Nothing                         = tour5
    | tour6 /= Nothing                         = tour6
    | tour7 /= Nothing                         = tour7
    | tour8 /= Nothing                         = tour8
    | n     == Board.boardSize hist            = hist1
    | otherwise        = Nothing
        where   tour1 = tour (x - 1) (y + 2) (n + 1) hist1
                tour2 = tour (x + 1) (y + 2) (n + 1) hist1
                tour3 = tour (x - 2) (y + 1) (n + 1) hist1
                tour4 = tour (x - 2) (y - 1) (n + 1) hist1
                tour5 = tour (x - 1) (y - 2) (n + 1) hist1
                tour6 = tour (x + 1) (y - 2) (n + 1) hist1
                tour7 = tour (x + 2) (y + 1) (n + 1) hist1
                tour8 = tour (x + 2) (y - 1) (n + 1) hist1
                hist1 = update x y (Board.Visited n) hist