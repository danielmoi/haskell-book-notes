mult1 = x * y
  where
    x = 5
    y = 6

mult2 = x * y
  where x = 5
        y = 6

-- 30

{-
THIS CAUSES AN ERROR:
We need to indent y properly

mult1 = x * y
  where x = 5
  y = 6


-}
