data Token =
  TKPunct String |
  TKNum Int |
  TKEOF
  deriving (Show)

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
  IR_NUM Int  -- Integer
  deriving (Show)
type IR = BTree IRNode

tokenize :: String -> [Token]
tokenize = undefined

parse :: [Token] -> IR
parse = undefined

codegen :: IR -> String
codegen = undefined

compile :: String -> String
compile = codegen . parse . tokenize

main = undefined