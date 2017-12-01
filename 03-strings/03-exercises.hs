{-
concat [[1, 2, 3], [4, 5, 6]]
++ [1, 2, 3] [4, 5, 6]
(++) "hello" " world"
["hello" ++ " world]
4 !! "hello"
(!!) "hello" 4
take "4 lovely"
take 3 "awesome"
-}


concat [[1, 2, 3], [4, 5, 6]]

-- ++ [1, 2, 3] [4, 5, 6]
(++) [1, 2, 3] [4, 5, 6]

(++) "hello" " world"

["hello" ++ " world"]


"hello" !! 4

(!!) "hello" 4

take 4 "lovely"

take 3 "awesome"


-- Building functions
"Curry is awesome" ++ "!"

"Curry is awesome" !! 4

(drop 9 "Curry is awesome") ++ "!"

