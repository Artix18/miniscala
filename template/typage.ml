open Ast
open Parser
open Lexing

(*type args_type = ArgsType of typ list
and typ = nom_classe * args_type*)

module Smap = Map.Make(String)
type env = typ Smap.t (*string = ident *)
type typesAbstraitsParamClasse = ((ident * typ) list) Smap.t (* ident x typ *)

let getTypeAbstrait nom classe membresClasse = (* doit renvoyer type abstrait de classe.nom *)
	snd (List.find (fun (x,y) -> x=nom) (Smap.find classe membresClasse))

let getTypeConcret nom existingTypes typeParams = match nom with
	| nom when Smap.mem nom existingTypes                      -> Smap.find nom existingTypes
	| nom when List.exists (fun (x,y) -> x=nom) typeParams    -> List.find (fun (x,y) -> x=nom) typeParams
	| _ -> failwith "Cette classe n'existe pas."

let rec getTypeVarDeClasseInstanciee t mExTy listeTypePar = 
	let (tAttribue, liste) = getTypeConcret (fst t) mExTy listeTypePar in
	let param_abs = snd t in
	(tAttribue, List.map2 (fun tau1 tau2 -> let tt1 = getTypeVarDeClasseInstanciee tau1 mExTy listeTypePar in (if tt1 <> tau2 then failwith "Types incompatibles" else tt1)) param_abs liste)

let rec type_expr env mExTy mMemClasse = function
	| Ecst(cst) -> assert(false) (* type de cst *)
	| Ethis -> Smap.find "this" env
	| Enull -> Smap.find "Null" env
	| Eaccess(x) -> ( match x with
					   | Lident(id) -> if Smap.exists id env then Smap.find id env
					                   else type_expr env mExTy mMemClasse expr(Eaccess(Laccess(Ethis, id)))
					   | Laccess(ex, id) -> let typeDeEx = type_expr env mExTy mMemClasse ex in 
					   						let listeTypePar = snd typeDeEx in
					   						let classeDeEx = fst typeDeEx in
					   						let typeAbsId = getTypeAbstrait id classeDeEx mMemClasse in
					   						getTypeVarDeClasseInstanciee typeAbsId mExTy listeTypePar (* TODO definir mTypePar *)
					)
	| _ -> assert(false)
	(*| Eaffect of left_value * expr
	| Ecall of left_value * args_type * (expr list)
	| Enew of nom_classe * args_type * (expr list)
	| Eunop of unop * expr
	| Ebinop of binop * expr * expr
	| Eif of expr * expr * expr
	| Ewhile of expr * expr
	| Ereturn of expr
	| Eprint of expr
	| Ebloc of instruction list*)
