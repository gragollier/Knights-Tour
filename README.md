# Knights-Tour
Solving the Knight's Tour problem in Haskell as a project for strengthening my Haskell knowledge 

## The Problem
The Knight's Tour is a problem that comes from chess. Given an N X M sized chessboard, find possible paths for a Knight to take in order to cover every spot on the board checking every starting position. For some starting positions or board sizes this may be impossible. For more information see this Wikipedia article: [Knight's Tour](https://en.wikipedia.org/wiki/Knight%27s_tour "Knight's Tour")

## This Solution
This solution uses a divide and conquer, recursive approach. This is probably far from the most efficient solution, but the goal was more for improving my knowledge of Haskell.

## Usage
Required Packages (Install using `cabal install`):
* vector
* parallel

After installing decencies, build using
```shell
$> ghc -threaded main.hs
```
Run using 
```shell
$> ./main n m +RTS -Nx
```
Where `n` and `m` are the board size and `x` is the number of threads you wish to use. For example, to run on a 4X4 board with 2 threads use
```shell
$> ./main 4 4 +RTS -N2
```

## TODO
* Add Pretty Printing so the output is nicer to look at
* Add support for saving directly to file instead of needing to pipe it
* Cleanup Board Module
* Find builtin library function to replace `safeHead`
* ~~Cleanup Recursive calls in Tour Module~~