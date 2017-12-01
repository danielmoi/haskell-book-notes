{- let a = "a" -}
{- let b = "b" -}

a = ["a"]
b = ["b"]
c = [["c"]]
d = [[["d"]]]


result = concat [a, b]

-- this won't work because b is of a different type to c
-- wrong = concat [b, c]
--
-- :t concat
-- concat :: Foldable t => t [a] -> [a]

-- Exercises
++ [1, 2, 3] [4, 5, 6]
[1, 2, 3] ++ [4, 5, 6]
-- [1,2,3,4,5,6]

'<' ++ 'Haskell'
"<" ++ "Haskell"




