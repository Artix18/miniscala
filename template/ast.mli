
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


type pargs_type = PArgsType of typ list
and ptyp = nom_classe * interv * pargs_type
  
type pexpr =
  | PEcst of constant
  | PEthis
  | PEnull
  | PEaccess of pleft_value
  | PEaffect of pleft_value * plocd_expr * (pos)
  | PEcall of pleft_value * pargs_type * (plocd_expr list)
  | PEnew  of nom_classe * pargs_type * (plocd_expr list)
  | PEunop of unop * plocd_expr
  | PEbinop of binop * plocd_expr * plocd_expr * (pos)
  | PEif of plocd_expr * plocd_expr * plocd_expr
  | PEwhile of plocd_expr * plocd_expr
  | PEreturn of plocd_expr
  | PEprint of plocd_expr
  | PEbloc of pinstruction list

and plocd_expr = pexpr * ptyp
  
and pinstruction =
  | PIdef of pvar
  | PIexpr of plocd_expr
  
and pvar = bool (* is const *) * ident * (typ option) * locd_expr * (interv)
  
and pleft_value =
  | PLident of ident * (interv)
  | PLaccess of locd_expr * ident * (interv)
  
type pparam = (ident * typ)

type pparam_type =
  | PPTsimple  of nom_classe
  | PPTbigger  of nom_classe * typ (* T >: typ *) (* var x : T *)
  | PPTsmaller of nom_classe * typ (* T <: typ *)

type pmodifPTC = PModifNone | PModifPlus | PModifMinus
type pparam_type_class = pmodifPTC * pparam_type
  
type pmethode = ident * pparam_type list * int * locd_expr (* à peu près *)

type pdecl =
  | PDvar of pvar
  | PDmeth of pmethode
  
type pclas = PClass of ident * interv * param_type_class list * param list * (typ * (locd_expr list)) * pdecl list

type pclass_Main = pdecl list

type pfile = pclas list * pclass_Main


