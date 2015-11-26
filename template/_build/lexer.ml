# 4 "lexer.mll"
 
  open Lexing
  open Ast
  open Parser

  exception Lexing_error of string

  let kwd_tbl = [ "class", CLASS; "def", DEF;
                  "else", ELSE; "eq", CMP_EG Beqphy; "extends", EXTENDS;
                  "false", CST (Cbool false); "if", IF; "ne", CMP_EG Bneqphy; "new", NEW;
                  "null", CST Cnull; "object", OBJECT;
                  "override", OVERRIDE; "print", PRINT;
                  "return", RETURN; "this", CST Cthis; "true", CST (Cbool true);
                  "val", VAL; "var", VAR; "while", WHILE ]
  let id_or_kwd s = try List.assoc s kwd_tbl with _ -> IDENT s

  let newline lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }

  let string_buffer = Buffer.create 1024

# 26 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\220\255\221\255\222\255\078\000\223\255\226\255\227\255\
    \228\255\229\255\230\255\231\255\232\255\233\255\234\255\235\255\
    \012\000\001\000\034\000\079\000\002\000\003\000\246\255\248\255\
    \249\255\250\255\093\000\109\000\003\000\255\255\001\000\253\255\
    \252\255\243\255\242\255\225\255\240\255\224\255\238\255\237\255\
    \236\255\226\000\249\255\250\255\063\001\255\255\251\255\252\255\
    \253\255\254\255\142\000\253\255\254\255\047\000\255\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\032\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \035\000\035\000\016\000\014\000\011\000\010\000\255\255\255\255\
    \255\255\255\255\004\000\008\000\001\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\002\000\255\255";
  Lexing.lex_default = 
   "\001\000\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \000\000\000\000\255\255\255\255\255\255\000\000\030\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\051\000\000\000\000\000\255\255\000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\028\000\029\000\032\000\028\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \028\000\020\000\003\000\028\000\000\000\022\000\017\000\039\000\
    \015\000\014\000\023\000\025\000\009\000\024\000\008\000\027\000\
    \005\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\007\000\006\000\019\000\021\000\018\000\034\000\
    \033\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\013\000\037\000\012\000\054\000\038\000\
    \000\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\011\000\016\000\010\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \040\000\035\000\000\000\000\000\036\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\031\000\
    \052\000\000\000\000\000\000\000\030\000\000\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \053\000\000\000\000\000\000\000\026\000\000\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\255\255\043\000\043\000\045\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\044\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
    \043\000\046\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\047\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\049\000\000\000\000\000\
    \000\000\000\000\000\000\048\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\042\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    ";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\030\000\028\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\028\000\255\255\000\000\000\000\017\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\020\000\
    \021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\018\000\000\000\053\000\018\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \016\000\019\000\255\255\255\255\019\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\027\000\
    \050\000\255\255\255\255\255\255\027\000\255\255\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \050\000\255\255\255\255\255\255\026\000\255\255\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \026\000\026\000\026\000\026\000\026\000\026\000\026\000\026\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\030\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\044\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\050\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\044\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\044\000\255\255\255\255\
    \255\255\255\255\255\255\044\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\041\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    ";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec next_token lexbuf =
    __ocaml_lex_next_token_rec lexbuf 0
and __ocaml_lex_next_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 35 "lexer.mll"
            ( newline lexbuf; next_token lexbuf )
# 221 "lexer.ml"

  | 1 ->
# 37 "lexer.mll"
            ( next_token lexbuf )
# 226 "lexer.ml"

  | 2 ->
# 38 "lexer.mll"
            ( bigComment lexbuf )
# 231 "lexer.ml"

  | 3 ->
# 40 "lexer.mll"
            ( newline lexbuf; next_token lexbuf )
# 236 "lexer.ml"

  | 4 ->
let
# 41 "lexer.mll"
             id
# 242 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 41 "lexer.mll"
                ( id_or_kwd id )
# 246 "lexer.ml"

  | 5 ->
# 42 "lexer.mll"
            ( PLUS )
# 251 "lexer.ml"

  | 6 ->
# 43 "lexer.mll"
            ( MINUS )
# 256 "lexer.ml"

  | 7 ->
# 44 "lexer.mll"
            ( TIMES )
# 261 "lexer.ml"

  | 8 ->
# 45 "lexer.mll"
            ( DIV )
# 266 "lexer.ml"

  | 9 ->
# 46 "lexer.mll"
            ( MOD )
# 271 "lexer.ml"

  | 10 ->
# 47 "lexer.mll"
            ( EQUAL )
# 276 "lexer.ml"

  | 11 ->
# 48 "lexer.mll"
            ( BANG )
# 281 "lexer.ml"

  | 12 ->
# 49 "lexer.mll"
            ( CMP_EG Beq )
# 286 "lexer.ml"

  | 13 ->
# 50 "lexer.mll"
            ( CMP_EG Bneq )
# 291 "lexer.ml"

  | 14 ->
# 51 "lexer.mll"
            ( CMP_INEG Blt )
# 296 "lexer.ml"

  | 15 ->
# 52 "lexer.mll"
            ( CMP_INEG Ble )
# 301 "lexer.ml"

  | 16 ->
# 53 "lexer.mll"
            ( CMP_INEG Bgt )
# 306 "lexer.ml"

  | 17 ->
# 54 "lexer.mll"
            ( CMP_INEG Bge )
# 311 "lexer.ml"

  | 18 ->
# 55 "lexer.mll"
            ( LOG_AND )
# 316 "lexer.ml"

  | 19 ->
# 56 "lexer.mll"
            ( LOG_OR )
# 321 "lexer.ml"

  | 20 ->
# 57 "lexer.mll"
            ( LP )
# 326 "lexer.ml"

  | 21 ->
# 58 "lexer.mll"
            ( RP )
# 331 "lexer.ml"

  | 22 ->
# 59 "lexer.mll"
            ( LSQ )
# 336 "lexer.ml"

  | 23 ->
# 60 "lexer.mll"
            ( RSQ )
# 341 "lexer.ml"

  | 24 ->
# 61 "lexer.mll"
            ( LBRA )
# 346 "lexer.ml"

  | 25 ->
# 62 "lexer.mll"
            ( RBRA )
# 351 "lexer.ml"

  | 26 ->
# 63 "lexer.mll"
            ( COMMA )
# 356 "lexer.ml"

  | 27 ->
# 64 "lexer.mll"
            ( DOT )
# 361 "lexer.ml"

  | 28 ->
# 65 "lexer.mll"
            ( COLON )
# 366 "lexer.ml"

  | 29 ->
# 66 "lexer.mll"
            ( SEMICOLON )
# 371 "lexer.ml"

  | 30 ->
# 67 "lexer.mll"
            ( TYPE_LT )
# 376 "lexer.ml"

  | 31 ->
# 68 "lexer.mll"
            ( TYPE_BT )
# 381 "lexer.ml"

  | 32 ->
let
# 69 "lexer.mll"
               s
# 387 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 70 "lexer.mll"
            ( try CST (Cint (int_of_string s))
              with _ -> raise (Lexing_error ("constant too large: " ^ s)) )
# 392 "lexer.ml"

  | 33 ->
# 72 "lexer.mll"
            ( CST (Cstring (string lexbuf)) )
# 397 "lexer.ml"

  | 34 ->
# 73 "lexer.mll"
            ( EOF )
# 402 "lexer.ml"

  | 35 ->
let
# 74 "lexer.mll"
         c
# 408 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 74 "lexer.mll"
            ( raise (Lexing_error ("illegal character: " ^ String.make 1 c)) )
# 412 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_next_token_rec lexbuf __ocaml_lex_state

and string lexbuf =
    __ocaml_lex_string_rec lexbuf 41
and __ocaml_lex_string_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 78 "lexer.mll"
      ( let s = Buffer.contents string_buffer in
	        Buffer.reset string_buffer;
	        s )
# 425 "lexer.ml"

  | 1 ->
# 82 "lexer.mll"
      ( Buffer.add_char string_buffer '\n';
	    string lexbuf )
# 431 "lexer.ml"

  | 2 ->
# 85 "lexer.mll"
      ( Buffer.add_char string_buffer '\t';
	    string lexbuf )
# 437 "lexer.ml"

  | 3 ->
# 88 "lexer.mll"
      ( Buffer.add_char string_buffer '\\';
	    string lexbuf )
# 443 "lexer.ml"

  | 4 ->
# 91 "lexer.mll"
      ( Buffer.add_char string_buffer '"';
	    string lexbuf )
# 449 "lexer.ml"

  | 5 ->
let
# 93 "lexer.mll"
               c
# 455 "lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 94 "lexer.mll"
      ( Buffer.add_char string_buffer c;
	    string lexbuf )
# 460 "lexer.ml"

  | 6 ->
# 97 "lexer.mll"
      ( raise (Lexing_error "unterminated string") )
# 465 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_string_rec lexbuf __ocaml_lex_state

and bigComment lexbuf =
    __ocaml_lex_bigComment_rec lexbuf 50
and __ocaml_lex_bigComment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 100 "lexer.mll"
         ( next_token lexbuf )
# 476 "lexer.ml"

  | 1 ->
# 101 "lexer.mll"
         ( newline lexbuf; bigComent lexbuf )
# 481 "lexer.ml"

  | 2 ->
# 102 "lexer.mll"
         ( bigComment lexbuf )
# 486 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; __ocaml_lex_bigComment_rec lexbuf __ocaml_lex_state

;;

# 104 "lexer.mll"
 
  

# 496 "lexer.ml"