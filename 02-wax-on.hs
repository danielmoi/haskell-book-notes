{-
z = 7

x = y ^ 2

waxOn = x * 5

y = z + 8
-}


-- waxOn re-written using a where CLAUSE
-- x will now be "out of scope" in the REPL
waxOn = x * 5
  where
    z = 7
    x = y ^ 2
    y = z + 8

triple x = x * 3
-- 3375

waxOff x = triple x
