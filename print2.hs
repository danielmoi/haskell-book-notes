module Print2 where

main :: IO ()

main = do
  putStrLn "Count to four for me:"
  putStr "one, two"
  putStr ", three, and"
  putStrLn " four!"


{-
*Print2> main
Count to four for me:
one, two, three, and four!
- }

