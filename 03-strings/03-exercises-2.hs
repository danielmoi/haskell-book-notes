module Exercises2 where

addBang :: String -> String
addBang x = x ++ "!"

{- main :: IO () -}
{- main do -}
  {- putStrLn addBang "Curry is awesome" -}

main :: IO()
main = do
  -- need to use LET in a DO block
  let result = addBang "Curry is awesome"

  -- can't end without something else...
  -- why?
  -- the last statement in a DO block must be an expression
  putStrLn result

  {- let magic = third s ++ first s -}
  let magic = rvrs s

  putStrLn magic



giveThird :: String -> Char
giveThird str = str !! 2

myStr = "Curry is awesome!"
giveVar :: Int -> Char
giveVar x = myStr !! x

third :: String -> String
third x = drop 9 x

first :: String -> String
first x = take 5 x

rvrs :: String -> String
rvrs x = drop 9 x ++ (drop 5 (take 9 x)) ++ take 5 x



s = "CURRY IS AWESOME"
