module Board
where

import Data.Vector as V

data State = Empty | Visited Int deriving (Show, Eq)

type Board = Vector (Vector State)

intialize :: Int -> Int -> Board
intialize x y = V.replicate x $ V.replicate y Empty

maxX :: Board -> Int
maxX b = V.length b

maxY :: Board -> Int
maxY b = V.length $ b ! 0 -- TODO: Maybe switch this and maxX to be Monadic

inBounds :: Int -> Int -> Maybe Board -> Bool
inBounds x y (Just b) = (x >= 0) && (x < (V.length b))  && (y >= 0) && (y < (V.length (b ! 0)))

boardElm :: Int -> Int -> Maybe Board -> State
boardElm x y (Just b) = b ! x ! y

boardSize :: Maybe Board -> Int
boardSize Nothing = 0
boardSize (Just b) = (maxX b) * (maxY b)

update :: Int -> Int -> State-> Maybe Board -> Maybe Board
update _ _ _ Nothing = Nothing
update x y s (Just b) = Just $ b // [(x, (b ! x) // [(y, s)] ) ]