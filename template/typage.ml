open Ast
open Parser
open Lexing

(*type args_type = ArgsType of typ list
and typ = nom_classe * args_type*)

module Smap = Map.Make(String)
type env = typ Smap.t (*string = ident *)
type typesAbstraitsParamClasse = ((ident * typ) list) Smap.t (* ident x typ *)

(*ça marche, testé avec a = Smap.add "42" [("lol", ("truc", (42,51), []))] a;; *)
let getTypeAbstrait nom classe membresClasse = (* doit renvoyer type abstrait de classe.nom *)
	snd (List.find (fun (x,y) -> x=nom) (Smap.find classe membresClasse))

(* ça a l'air bon, oui. *)
let getTypeConcret nom existingTypes typeParams = match nom with
	| nom when Smap.mem nom existingTypes                      -> Smap.find nom existingTypes
	| nom when List.exists (fun (x,y,z) -> x=nom) typeParams     -> (List.find (fun (x,y,z) -> x=nom) typeParams)
	| _ -> failwith "Cette classe n'existe pas."

(* il y a un gros bug ici mais je ne vois pas pourquoi. Le type de la fonction est scandaleux. *)
let rec getTypeVarDeClasseInstanciee t mExTy listeTypePar = 
	let (a,b,c)=t in
	let (tAttribue, deco, liste) = getTypeConcret a mExTy listeTypePar in
	let param_abs = c in
	let lres = List.map2 (fun tau1 tau2 -> let tt1 = getTypeVarDeClasseInstanciee tau1 mExTy listeTypePar in ((*if tt1 <> tau2 then failwith "Types incompatibles" else*) ("lol", (42,42), []))) [] [](*param_abs liste*) in
	(tAttribue, deco, lres)

(* j'ai mis nawak pour les loc_expr et inter, à toi de voir. Mais ça compile *)
let rec type_expr env mExTy mMemClasse loc_expr = match fst loc_expr with
	| Ecst(cst) -> assert(false) (* type de cst *)
	| Ethis -> Smap.find "this" env
	| Enull -> Smap.find "Null" env
	| Eaccess(x) -> ( match x with
					   | Lident(id, inter) -> if Smap.mem id env then Smap.find id env
					                   else type_expr env mExTy mMemClasse (Eaccess(Laccess((Ethis,inter), id, inter)), inter)
					   | Laccess(ex, id, inter) -> let typeDeEx = type_expr env mExTy mMemClasse ex in 
					   						let (a,b,c) = typeDeEx in
					   						let listeTypePar = c in
					   						let classeDeEx = a in
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
