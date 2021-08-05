module Parse (
  parse,
  IR,
) where

import Tokenize (Token, NumVal)

data BTree a =
  Empty |
  Node {
    value :: a,
    lhs :: BTree a,
    rhs :: BTree a
  }
  deriving (Show)

data IRNode =
  IR_ADD | -- +
  IR_SUB | -- -
  IR_MUL | -- *
  IR_DIV | -- /
  IR_NEG | -- unary -
  IR_EQ |  -- ==
  IR_NE |  -- !=
  IR_LT |  -- <
  IR_LE |  -- <=
  IR_NUM NumVal  -- Integer
  deriving (Show)

type IR = BTree IRNode

parse :: [Token] -> IR
parse = undefined