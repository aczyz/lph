module Graph where

import Formulas
import Operator
import Data.Graph

--takes list of Atoms and returns list of Ints
atomToInt :: [Atom] -> [Int]
atomToInt []     = []
atomToInt (x:xs) = case x of
                        A b -> b : atomToInt xs

--takes list of Ints and returns list of Atoms
intToAtom :: [Int] -> [Atom]
intToAtom []     = []
intToAtom (x:xs) = case x of
                         b -> A b : intToAtom xs

{-
takes Herbrand Base and returns bounds for the graph 
(requirement: Atoms in program have to be numbered in order)
-}
bounds' :: LogicP -> (Int, Int)
bounds' xs = (minimum (atomToInt (bP xs)), maximum (atomToInt (bP xs)))


zipEdges :: [Int] -> [Int] -> [(Int, Int)]        
zipEdges _ []     = []
zipEdges (x:xs) (y:ys) = (x, y) : zipEdges (x:xs) ys

-- creates list of pairs, each containing HC Head and one element of HC Body
edges' :: LogicP -> [(Int, Int)]
edges' [] = []
edges' (x:xs) = zipEdges (atomToInt (hClHead x)) (atomToInt (hClBody x)) ++ edges' xs

--creates a graph
graphG :: LogicP -> Graph
graphG x = buildG (bounds' x) (edges' x)


graph = graphG


--gr = buildG (1,7) [(1,2), (3,2), (4,5), (7,2), (6,5), (1,7), (2,4)]