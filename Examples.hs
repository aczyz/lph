module Examples where

import Formulas


ex1 = [(A 1, [], []), (A 2, [], [A 3]), (A 4, [A 1], [A 3])]
ex2 = [(A 1, [A 3, A 5], [A 2, A 7]), (A 8, [A 9], [A 10, A 11]), (A 12, [A 4, A 6], [A 13, A 11])]

--loop
ex3 = [(A 1, [A 3], []), (A 2, [A 1], [A 4]), (A 3, [], [A 2])]

