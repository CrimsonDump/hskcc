module Main (main) where

import Tokenize (tokenize)
import Parse (parse)
import Codegen (codegen)

compile :: String -> String
compile = codegen . parse . tokenize

main = do
  print $ tokenize ""
  print $ tokenize "0"
  print $ tokenize "42"
  print $ tokenize "5+20-4"
  print $ tokenize  " 12 + 34 - 5 "
  print $ tokenize  "5+6*7"
  print $ tokenize  "5*(9-6)"
  print $ tokenize "(3+5)/2"
  print $ tokenize  "-10+20"
  print $ tokenize  "- -10"
  print $ tokenize  "- - +10"
  print $ tokenize "0==1"
  print $ tokenize "42==42"
  print $ tokenize "0!=1"
  print $ tokenize "42!=42"
  print $ tokenize "0<1"
  print $ tokenize "1<1"
  print $ tokenize "2<1"
  print $ tokenize "0<=1"
  print $ tokenize "1<=1"
  print $ tokenize "2<=1"
  print $ tokenize "1>0"
  print $ tokenize "1>1"
  print $ tokenize "1>2"
  print $ tokenize "1>=0"
  print $ tokenize "1>=1"
  print $ tokenize "1>=2"