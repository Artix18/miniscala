
(* Analyseur lexical pour Petit Scala *)

{
  open Lexing
  open Ast
  open Parser

  exception Lexing_error of string

  let kwd_tbl = [ "class", CLASS; "def", DEF;
                  "else", ELSE; "eq", CMP_EG (Beqphy); "extends", EXTENDS;
                  "false", CST (Cbool false); "if", IF; "ne", CMP_EG (Bneqphy); "new", NEW;
                  "null", EXPR (Enull); "object", OBJECT;
                  "override", OVERRIDE (); "print", PRINT;
                  "return", RETURN; "this", EXPR (Ethis); "true", CST (Cbool true);
                  "val", VAR(true); "var", VAR(false); "while", WHILE ]
  let id_or_kwd s = try List.assoc s kwd_tbl with _ -> IDENT s

  let newline lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_lnum = pos.pos_lnum + 1; pos_bol = pos.pos_cnum }

  let string_buffer = Buffer.create 1024
}

let letter = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = letter (letter | digit | '_')*
let integer = '0' | ['1'-'9'] digit*
let strChar = [' ' '!' '#'-'[' ']'-'~']

rule next_token = parse
  | '\n'    { newline lexbuf; next_token lexbuf }
  | (' '|'\t')+
            { next_token lexbuf }
  | "/*"    { bigComment lexbuf }
  | "//" [^'\n']* '\n' 
            { newline lexbuf; next_token lexbuf }
  | ident as id { id_or_kwd id }
  | '+'     { PLUS }
  | '-'     { MINUS }
  | '*'     { TIMES }
  | '/'     { DIV }
  | '%'     { MOD }
  | '='     { EQUAL }
  | '!'     { BANG }
  | "=="    { CMP_EG Beq }
  | "!="    { CMP_EG Bneq }
  | "<"     { CMP_INEG Blt }
  | "<="    { CMP_INEG Ble }
  | ">"     { CMP_INEG Bgt }
  | ">="    { CMP_INEG Bge }
  | "&&"    { LOG_AND }
  | "||"    { LOG_OR }
  | '('     { LP }
  | ')'     { RP }
  | '['     { LSQ }
  | ']'     { RSQ }
  | '{'     { LBRA }
  | '}'     { RBRA }
  | ','     { COMMA }
  | '.'     { DOT }
  | ':'     { COLON }
  | ';'     { SEMICOLON }
  | "<:"    { TYPE_LT }
  | ">:"    { TYPE_BT }
  | integer as s
            { try let a = int_of_string s in
            	if a >= (1 lsl 31) then raise (Failure ("Et il n'existe pas de constante négative dans la syntaxe."))
            	else
            	CST (Cint (a))
              with _ -> raise (Lexing_error ("constant too large: " ^ s)) }
  | '"'     { CST (Cstring (string lexbuf)) }
  | eof     { EOF }
  | _ as c  { raise (Lexing_error ("illegal character: " ^ String.make 1 c)) }

and string = parse
  | '"'
      { let s = Buffer.contents string_buffer in
	        Buffer.reset string_buffer;
	        s }
  | "\\n"
      { Buffer.add_char string_buffer '\n';
	    string lexbuf }
  | "\\t"
      { Buffer.add_char string_buffer '\t';
	    string lexbuf }
  | "\\\\"
      { Buffer.add_char string_buffer '\\';
	    string lexbuf }
  | "\\\""
      { Buffer.add_char string_buffer '"';
	    string lexbuf }
  | '\\'
  	  { raise (Lexing_error "invalid escape character") }
  | '\n'
  	  { raise (Lexing_error "unterminated string before end of line") }
  | strChar as c
      { Buffer.add_char string_buffer c;
	    string lexbuf }
  | eof
      { raise (Lexing_error "unterminated string") }

and bigComment = parse
  | "*/" { next_token lexbuf }
  | '\n' { newline lexbuf; bigComment lexbuf }
  | eof  { raise (Lexing_error "unterminated comment") }
  | _    { bigComment lexbuf }

{
  
}



