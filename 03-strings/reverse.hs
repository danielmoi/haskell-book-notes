module Reverse where

rvrs :: String -> String
rvrs x = drop 9 x ++ (drop 5 (take 9 x)) ++ take 5 x

magicPrint :: IO ()
magicPrint = do
  putStrLn (rvrs "CURRY IS AWESOME")

main :: IO ()
main = putStrLn (rvrs "CURRY IS AWESOME")

main2 = putStrLn $ rvrs "CURRY IS AWESOME"
{- main = do -}
  {- let result = rvrs "CURRY IS AWESOME" -}
  {- putStrLn result -}

