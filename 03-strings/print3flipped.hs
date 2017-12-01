module Print3Flipped where

myGreeting :: String
myGreeting = (++) "HELLO" " WORLD!"

hello :: String
hello = "hello"

world :: String
world = " world!"

main :: IO()
main = do
  putStrLn myGreeting
  putStrLn greet2
  where
    greet2 = (++) hello world
