exception Error

type token = 
  | WHILE
  | VAR
  | VAL
  | TYPE_LT
  | TYPE_BT
  | TIMES
  | SEMICOLON
  | RSQ
  | RP
  | RETURN
  | RBRA
  | PRINT
  | PLUS
  | OVERRIDE
  | OBJECT
  | NEW
  | MOD
  | MINUS
  | LSQ
  | LP
  | LOG_OR
  | LOG_AND
  | LBRA
  | IF
  | IDENT of (string)
  | EXTENDS
  | EQUAL
  | EOF
  | ELSE
  | DOT
  | DIV
  | DEF
  | CST of (Ast.constant)
  | COMMA
  | COLON
  | CMP_INEG of (Ast.binop)
  | CMP_EG of (Ast.binop)
  | CLASS
  | BANG


val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.file)