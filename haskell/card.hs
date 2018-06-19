{-|
  This is the haskell-port of heckbert's card raytracer.
  Special thanks to Paul Heckbert

  See: http://tproger.ru/translations/business-card-raytracer

  12-May, 2018 : mayton - In beginning...
  28-May, 2018 : mayton - Fix for 'sum', Add console tests.
-}

import System.IO
import Text.Printf

width = 512 
    
height = 512
    
g = [0x0003C712,
     0x00044814,
     0x00044818,
     0x0003CF94,
     0x00004892,
     0x00004891,
     0x00038710,
     0x00000010,
     0x00000010]

data Vector = Vector { x :: Double, 
                       y :: Double, 
                       z :: Double } deriving (Show, Eq)


sprod :: Vector -> Vector -> Double
sprod v1 v2 = (x v1) * (x v2) + (y v1) * (y v2) + (z v1) * (z v2)

{- Vector sum of vector V1 and V2 -}
vsum :: Vector -> Vector -> Vector
vsum v1 v2 = (Vector 
               ((x v1) + (x v2)) 
               ((y v1) + (y v2)) 
               ((z v1) + (z v2)))

{--}
vprod :: Vector -> Vector -> Vector
vprod v1 v2 = (Vector
               (((y v1) * (z v2) - (z v1) * (y v2)))
               (((z v1) * (x v2) - (x v1) * (z v2)))
               (((x v1) * (y v2) - (y v1) * (x v2))))


prod :: Vector -> Double -> Vector
prod v r = (Vector (r * (x v)) (r * (y v)) (r * (z v)))

{- Normalyze vector V -}
norm :: Vector -> Vector
norm v = prod v ( 1.0 / (sqrt (sprod v v) ) )

v1 = (Vector 3.0 4.0 5.0)
v2 = (Vector 4.0 5.0 6.0)


{-squareloop x :: Integer = 
  do
    putStrLn ("x = "++ x)
    squareloop (x - 1) 
-}
main = do
  putStrLn ("v1 = " ++ (show v1))
  putStrLn ("v2 = " ++ (show v2))
  putStrLn ("norm(v1) = " ++ (show (norm v1)))
  putStrLn ("vprod(v1,v2) = " ++ (show (vprod v1 v2)))
  putStrLn ("sprod(v1,v2) = " ++ (show (sprod v1 v2)))
  putStrLn ("prod(v1,2.0) = " ++ (show (prod v1 2.0)))
  putStrLn ("vsum(v1,v2) = " ++ (show (vsum v1 v2)))

