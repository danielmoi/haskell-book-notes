module TopOrLocal where

topLevelFunction :: Integer -> Integer
topLevelFunction x = x + woot + topLevelValue
  -- woot is invisible outside of topLevelFunction
  where woot :: Integer
        woot = 10

topLevelValue::Integer
topLevelValue = 5
