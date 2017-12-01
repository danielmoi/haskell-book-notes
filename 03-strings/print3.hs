module Print3 where

myGreeting :: String

myGreeting = "hello" ++ " world!"

hello :: String
hello = "HELLO"

world :: String
world = "WORLD!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting
  putStrLn thirdGreeting
  where
    secondGreeting = hello ++ world
    thirdGreeting = concat [hello, " ", world]

