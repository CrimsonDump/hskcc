module Tokenize (
  tokenize,
  Token,
  NumVal,
) where

import qualified Data.Char as C
import qualified Data.List as L
import Debug.Trace (trace)

type NumVal = Int
data Token =
  TKPunct String |
  TKNum NumVal |
  TKEOF
  deriving (Show)

charsOfPunct :: [Char]
charsOfPunct = ['+', '-', '*', '/', '=', '!', '<', '>', '(', ')']

strsOfPunct :: [String]
strsOfPunct = ["+", "-", "*", "/", "==", "!=", "<", "<=", ">", ">=", "(", ")"]

isPunctChar :: Char -> Bool
isPunctChar = (`elem` charsOfPunct)

tokenizeBackward :: String -> String -> (Token, String)
tokenizeBackward [] _ = error "no match or empty passed"
tokenizeBackward a s = if a `elem` strsOfPunct then (TKPunct a, s)
                          else tokenizeBackward (init a) (last a:s)

tokenizeForward :: String -> (Token, String)
tokenizeForward s = tokenizeBackward str rest
  where (str, rest) = span isPunctChar s

-- TODO: improve span and read
tokenizeNum :: String -> (Token, String)
tokenizeNum s = (TKNum (read num :: NumVal), rest)
  where (num, rest) = span C.isDigit s

tokenize :: String -> [Token]
tokenize [] = []
tokenize s@(x:xs)
  | C.isSpace x = tokenize xs
  | C.isDigit x = let (tk, res) = tokenizeNum s in tk : tokenize res
  | isPunctChar x = let (tk, res) = tokenizeForward s in tk : tokenize res
  | otherwise = error $ "unknown " ++ show x