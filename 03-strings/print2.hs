module Print2 where

main :: IO ()

main = do
  putStrLn "Count to four for me:"
  putStr "one, two"
  putStr ", three, and"
  putStrLn " four!"

{- Ln means that it will start a NEW INE -}

{-
*Print2> main
Count to four for me:
one, two, three, and four!
- }

