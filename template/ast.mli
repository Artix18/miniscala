
type pos = Lexing.position
type interv = pos * pos

type ident = string
type nom_classe = string
  
type unop =
  | Uneg | Unot
  
type binop =
  | Badd | Bsub | Bmul | Bdiv | Bmod
  | Beq | Bneq | Blt | Ble
  | Bgt | Bge (* comparaison structurelle *)
  | Beqphy | Bneqphy (* comparaison physique *) (** TODO : savoir lequel est lequel **)
  | Band | Bor (* paresseux ? *)

type constant =
  | Cunit
  | Cint of int
  | Cbool of bool
  | Cstring of string

type args_type = ArgsType of typ list
and typ = nom_classe * interv * args_type
  
type expr =
  | Ecst of constant
  | Ethis
  | Enull
  | Eaccess of left_value
  | Eaffect of left_value * locd_expr * (pos)
  | Ecall of left_value * args_type * (locd_expr list)
  | Enew  of nom_classe * args_type * (locd_expr list)
  | Eunop of unop * locd_expr
  | Ebinop of binop * locd_expr * locd_expr * (pos)
  | Eif of locd_expr * locd_expr * locd_expr
  | Ewhile of locd_expr * locd_expr
  | Ereturn of locd_expr
  | Eprint of locd_expr
  | Ebloc of instruction list

and locd_expr = expr * interv
  
and instruction =
  | Idef of var
  | Iexpr of locd_expr
  
and var = bool (* is const *) * ident * (typ option) * locd_expr * (interv)
  
and left_value =
  | Lident of ident * (interv)
  | Laccess of locd_expr * ident * (interv)
  
type param = (ident * typ)

type param_type =
  | PTsimple  of nom_classe
  | PTbigger  of nom_classe * typ (* T >: typ *) (* var x : T *)
  | PTsmaller of nom_classe * typ (* T <: typ *)

type modifPTC = ModifNone | ModifPlus | ModifMinus
type param_type_class = modifPTC * param_type
  
type methode = bool (* do_override *) * ident * param_type list * param list * typ * locd_expr * (interv (* jusqu'au type *))

type decl =
  | Dvar of var
  | Dmeth of methode
  
type clas = Class of ident * interv * param_type_class list * param list * (typ * (locd_expr list)) * decl list

type class_Main = decl list

type file = clas list * class_Main



(* Retour de typage *)

type pargs_type = PArgsType of ptyp list
and ptyp = nom_classe * pargs_type
  
type pexpr =
  | PEcst of constant
  | PEthis
  | PEnull
  | PEaccess of pleft_value
  | PEaffect of pleft_value * typd_expr
  | PEcall of pleft_value * pargs_type * (typd_expr list)
  | PEnew  of nom_classe * pargs_type * (typd_expr list)
  | PEunop of unop * typd_expr
  | PEbinop of binop * typd_expr * typd_expr
  | PEif of typd_expr * typd_expr * typd_expr
  | PEwhile of typd_expr * typd_expr
  | PEreturn of typd_expr
  | PEprint of typd_expr
  | PEbloc of pinstruction list

and typd_expr = pexpr * ptyp
  
and pinstruction =
  | PIdef of pvar
  | PIexpr of typd_expr
  
and pvar = ident * ptyp * expr
  
and pleft_value =
  | PLident of ident
  | PLaccess of typd_expr * ident
  
type pparam = (ident * ptyp)
  
type pmethode = ident * pparam list * typd_expr

type pdecl =
  | PDvar of pvar
  | PDmeth of pmethode
  
type pclas = PClass of ident * pparam list * (ptyp * (typd_expr list)) * pdecl list

type pclass_Main = pdecl list

type pfile = pclas list * pclass_Main


