
(* Analyseur syntaxique pour Petit Scala *)

%{
  open Ast
  exception Syntax_error of string
%}

%token <Ast.constant> CST
%token <Ast.binop> CMP_EG
%token <Ast.binop> CMP_INEG
%token <string> IDENT
%token <unit> OVERRIDE
%token <bool> VAR (* is const *)
%token <Ast.expr> EXPR
%token CLASS DEF ELSE EXTENDS IF NEW OBJECT PRINT RETURN WHILE
%token EOF
%token LP RP LSQ RSQ LBRA RBRA COMMA DOT COLON SEMICOLON EQUAL TYPE_LT TYPE_BT
%token PLUS MINUS TIMES DIV MOD BANG LOG_AND LOG_OR

(* DŽfinitions des priorités et associativités des tokens *)

%right EQUAL

%left p_return
%left p_while
%left p_if
%left ELSE

%left LOG_OR
%left LOG_AND
%left CMP_EG
%left CMP_INEG
%left PLUS MINUS
%left TIMES DIV MOD
%right unary_op
%left DOT

(* Point d'entrée de la grammaire *)
%start file

(* Type des valeurs retournées par l'analyseur syntaxique *)
%type <Ast.file> file

%%

%inline opt_pl(opening, x, sep, closing):
| l = loption(delimited(opening, separated_list         (sep, x), closing)) {l}

%inline opt_ne_pl(opening, x, sep, closing):
| l = loption(delimited(opening, separated_nonempty_list(sep, x), closing)) {l}

file:
| cl = clas* ; main = class_Main EOF
    { (cl,main) }

clas:
| CLASS; name = IDENT ;
        ptcl = opt_ne_pl(LSQ, param_type_class, COMMA, RSQ) ;
        pl   = opt_pl   (LP,  param,            COMMA, RP ) ;
    LBRA
        dl = separated_list(SEMICOLON, decl) ;
    RBRA
    { Class (name, ptcl, pl, (("AnyRef", ArgsType []),[]), dl) }
| CLASS; name = IDENT ;
        ptcl = opt_ne_pl(LSQ, param_type_class, COMMA, RSQ) ;
        pl   = opt_pl   (LP,  param,            COMMA, RP ) ;
        EXTENDS ; ty = typ ;
        pt   = opt_pl   (LP,  expr,             COMMA, RP ) ;
    LBRA
        dl = separated_list(SEMICOLON, decl) ;
    RBRA
    { Class (name, ptcl, pl, (ty,pt), dl) }

decl:
| v = var     { Dvar  v }
| m = methode { Dmeth m }

var:
| isCst = VAR; id = IDENT ; EQUAL; e = expr { (isCst, id, None, e) }
| isCst = VAR; id = IDENT ; COLON ; ty = typ ; EQUAL; e = expr { (isCst, id, Some ty, e) }

methode:
| doOv = OVERRIDE? DEF name = IDENT;
        ptl = opt_ne_pl(LSQ, param_type, COMMA, RSQ) ;
        LP   pl = separated_list(COMMA,     param)       RP  ;
   		LBRA il = separated_list(SEMICOLON, instruction) RBRA ;
    { ((doOv <> None), name, ptl, pl, ("Unit", ArgsType []), Ebloc il) }
| doOv = OVERRIDE? DEF name = IDENT;
        ptl = opt_ne_pl(LSQ, param_type, COMMA, RSQ) ;
        LP  pl = separated_list(COMMA,     param)       RP  ;
        COLON ty = typ EQUAL ex = expr
    { ((doOv <> None), name, ptl, pl, ty, ex) }

param:
| r = separated_pair(IDENT, COLON, typ) {r}

param_type:
| id = IDENT                  { PTsimple   id      }
| id = IDENT TYPE_LT ty = typ { PTsmaller (id, ty) }
| id = IDENT TYPE_BT ty = typ { PTbigger  (id, ty) }

param_type_class:
| PLUS  pt = param_type { (ModifPlus,  pt) }
| MINUS pt = param_type { (ModifMinus, pt) }
|       pt = param_type { (ModifNone,  pt) }

typ:
| nom = IDENT ar = args_type { (nom, ar) }

args_type:
| r = opt_ne_pl(LSQ, typ, COMMA, RSQ) {ArgsType r}

class_Main:
| OBJECT nomMain = IDENT 
    LBRA
        dl = separated_list(SEMICOLON, decl) ;
    RBRA
    { if nomMain = "Main" then dl else raise (Syntax_error "Your Main object should be named 'Main'. I see you, Jerry, I know what you're trying to do here. You and I know very well what's going to happen next, and we don't want it to happen.") }

expr:
| LP RP
	{ Ecst Cunit }
| c = CST
    { Ecst c }
| e = EXPR
	{ e }
| LP ex = expr RP
    { ex }
| lv = left_value
    { Eaccess lv }
| lv = left_value EQUAL ex = expr
    { Eaffect (lv, ex) }
| lv = left_value ; ar = args_type ; LP le = separated_list(COMMA,expr) RP
    { Ecall (lv, ar, le) }
| NEW nt = IDENT ; ar = args_type ; LP le = separated_list(COMMA,expr) RP
    { Enew  (nt, ar, le) }
| uo = unop ; ex = expr %prec unary_op
    { Eunop (uo,ex) }
| e1 = expr ; bo = binop ; e2 = expr
    { Ebinop (bo, e1, e2) }
| IF    LP cond = expr RP pos = expr %prec p_if
    { Eif    (cond, pos, Ecst Cunit) }
| IF    LP cond = expr RP pos = expr ELSE neg = expr %prec p_if
    { Eif    (cond, pos, neg) }
| WHILE LP cond = expr RP loop = expr %prec p_while
    { Ewhile (cond, loop) }
| RETURN %prec p_return
    { Ereturn (Ebloc []) }
| RETURN e = expr %prec p_return
    { Ereturn e }
| PRINT LP ex = expr RP
    { Eprint ex }
| LBRA li = separated_list(SEMICOLON,instruction) RBRA
    { Ebloc li }

instruction:
| va = var  { Idef  va }
| ex = expr { Iexpr ex }

left_value:
| id = IDENT                { Lident id }
| ex = expr DOT id = IDENT  { Laccess (ex, id) }

%inline binop:
| PLUS      { Badd }
| MINUS     { Bsub }
| TIMES     { Bmul }
| DIV       { Bdiv }
| MOD       { Bmod }
| c=CMP_EG  { c }
| c=CMP_INEG{ c }
| LOG_AND   { Band }
| LOG_OR    { Bor  }

%inline unop:
| MINUS     { Uneg }
| BANG      { Unot }



