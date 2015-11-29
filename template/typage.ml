open Ast
open Parser

module Smap = Map.Make(String)
type env = typ Smap.t

let rec type_expr env = function
	| Ecst(cst) -> assert(false) (* type de cst *)
	| Eaccess(x) -> ( match x with
					   | Lident(id) -> if Smap.exists id env then Smap.find x env
					                   else type_expr env exp(Eaccess(Laccess(Cthis, id))) (* en gros, mais remplacer Cthis correctement *)
					   | Laccess(ex, id) -> assert(false) (* hum. En fait e = C(sigma) et donc sigma(id)... *)
					)
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