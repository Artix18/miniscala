
(* Arbres de syntaxe abstraite de Mini-Python *)

type ident = string
type nom_type = string
  
type unop =
  | Uneg | Unot
  
type binop =
  | Badd | Bsub | Bmul | Bdiv | Bmod
  | Beq | Bneq | Blt | Ble | Bgt | Bge (* comparaison structurelle *)
  | Beqphy | Bneqphy (* comparaison physique *) (** TODO : savoir lequel est lequel **)
  | Band | Bor (* paresseux ? *)

type constant =
  | Cunit
  | Cint of int
  | Cbool of bool
  | Cstring of string

type args_type = ArgsType of typ list
and typ = nom_type * args_type
  
type expr =
  | Ecst of constant
  | Ethis
  | Enull
  | Eaccess of left_value
  | Eaffect of left_value * expr
  | Ecall of left_value * args_type * (expr list)
  | Enew of nom_type * args_type * (expr list)
  | Eunop of unop * expr
  | Ebinop of binop * expr * expr
  | Eif of expr * expr * expr
  | Ewhile of expr * expr
  | Ereturn of expr
  | Eprint of expr
  | Ebloc of instruction list
  
and instruction =
  | Idef of var
  | Iexpr of expr
  
and var = bool (* is const *) * ident * (typ option) * expr
  
and left_value =
  | Lident of ident
  | Laccess of expr * ident
  
type param = (ident * typ)
  
type param_type =
  | PTsimple  of ident
  | PTbigger  of ident * typ
  | PTsmaller of ident * typ

type modifPTC = ModifNone | ModifPlus | ModifMinus
type param_type_class = modifPTC * param_type
  
type methode = bool (* do_override *) * ident * param_type list * param list * typ * expr

type decl =
  | Dvar of var
  | Dmeth of methode
  
type clas = Class of ident * param_type_class list * param list * (typ * (expr list)) * decl list

type class_Main = decl list

type file = clas list * class_Main


