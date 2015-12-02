open Ast
open Parser
open Lexing

module Smap = Map.Make(String)
type env = typ Smap.t (*string = ident *)
type typesAbstraitsParamClasse = ((ident * typ) list) Smap.t (* ident x typ *)
type classesDeclarees = clas Smap.t

(* env = typ map[nom_variable] *) (* il faudrait plutot env = (isConst, nom_variable) *)
(* mExTypes = type map[nom_de_classe] *)
(* typeParams = liste de types *) (* il faudrait map : nom_type_abstrait -> type_concret *)
(* membresClasse = map[nom_classe] contient une liste de ident*type, ie "x" et type de classe.x *)
(* classesDeclarees associe à un nom de classe la classe *)
(* typeDeClasse qui représente un type abstrait, sauf dans les cas pré-définis. (==mExTypes) *)
(* en fait typeDeClasse ne peut exister et est inutile sauf pour les cas de base... *)

let getTypeAbstrait nom_classe nom_var membresClasse = (* doit renvoyer type abstrait de classe.nom *)
	snd (List.find (fun (x,y) -> x=nom_var) (Smap.find nom_classe membresClasse))

(*
(* ça a l'air bon, oui. *)
let getTypeConcret nom existingTypes typeParams = match nom with
	| nom when Smap.mem nom existingTypes                      -> Smap.find nom existingTypes
	| nom when List.exists (fun (x,y,z) -> x=nom) typeParams   -> (List.find (fun (x,y,z) -> x=nom) typeParams)
	| _ -> failwith "Cette classe n'existe pas."
(** DEPRECATED **) *)

(*
(* il y a un gros bug ici mais je ne vois pas pourquoi. Le type de la fonction est scandaleux. *)
let rec getTypeVarDeClasseInstanciee t mExTy listeTypePar = 
	let (a,b,c)=(t : typ) in
	let (tAttribue, deco, arliste) = getTypeConcret a mExTy listeTypePar in
	let ArgsType(liste) = arliste in
	let ArgsType(param_abs) = c in
    let lres = List.map2 (fun tau1 tau2 -> let tt1 = getTypeVarDeClasseInstanciee tau1 mExTy listeTypePar in ((*if tt1 <> tau2 then failwith "Types incompatibles" else*) tt1)) param_abs liste in
	(tAttribue, deco, ArgsType(lres))

(** DEPRECATED **) *)

let lfor_all3 p l1 l2 l3 = 
	let rec aux l1 l2 l3 = match l1,l2,l3 with
		| [], [], [] -> true
		| a::b, c::d, e::f -> p a c e && (aux b d f)
	in
	let s1 = List.length l1 and s2 = List.length l2 and s3 = List.length l3 in
	if s1 <> s2 || s2 <> s3 then failwith "problème de taille de params, notre bug"
	else aux l1 l2 l3

let listeParamsAbstraits classe =
	let Class(_,listePTC,_,_,_)=classe in
	List.map (fun x -> let (_,pt)=x in match pt with |PTsimple(nom)|PTbigger(nom,_)|PTsmaller(nom,_) -> nom) listePTC

let getNameOfType typ =
	let (n,_,_) = typ in n

let getClassFromName name classesDeclarees =
	(Smap.find name classesDeclarees)

(*let getSimpleTypeFromClass classe = (*type abstrait bien sûr, mais seulement pour un type sans params *)
	let Class(nom, liste, _,_,_) = classe in
	if List.length liste <> 0 then failwith "On utilise mal cette fonction"
	else
	(nom, (lex_start_p, lex_start_p), ArgsType([]))

let getSTFromName name classesDeclarees = getSimpleTypeFromClass (getClassFromName name classesDeclarees)*)

let basicType name env = Smap.find name env

let getClassFromType typ classesDeclarees = 
	getClassFromName (getNameOfType typ) classesDeclarees

let typePere nomClasse classesDeclarees =
	let Class(_,_,_,(typPere, _),_) = (Smap.find nomClasse classesDeclarees) in
	typPere

let rec fleche c1 c2 classesDeclarees =
	(c1 = c2) || ((c1 <> "Any") && (fleche (getNameOfType (typePere c1 classesDeclarees)) c2 classesDeclarees))

let construitMapAssociative l1 l2 =
	List.fold_left2 (fun m x y -> Smap.add x y m) Smap.empty l1 l2

let rec remplaceType typ mSigma = (* mSigma associe à un nom abstrait son type *)
	let (name,lol,ArgsType(l)) = typ in
	let nouveauNom = (if (Smap.mem name mSigma) then getNameOfType (Smap.find name mSigma) else name) in (*il faudrait check que le nombre de params est juste. En fait je crois que ça ne peut même pas arriver qu'il soit non nul si on remplace... *)
	(nouveauNom, lol, ArgsType(List.map (fun x -> remplaceType x mSigma) l))

let construitSigma nom_classe paramsConcrets classesDeclarees = 
	construitMapAssociative (listeParamsAbstraits (Smap.find nom_classe classesDeclarees)) paramsConcrets

let rec sousType t1 t2 env classesDeclarees mContraintes = let (c1,_,ArgsType(l1)) = t1 and (c2,_,ArgsType(l2)) = t2 in match c1, c2 with
	| "Nothing", _ -> true
	| "Null",    _ -> not (sousType t2 (basicType "AnyVal" env) env classesDeclarees mContraintes)
	| c1(* *),     c2(* *) when c1=c2 
      -> let classeDeC1 = (Smap.find c1 classesDeclarees) in let Class(_,listeTypeAbstraits,_,_,_) = classeDeC1 in
	  	 let p x y z = (
	  	 	match fst x with
	  	 	| ModifNone  -> eqTypes y z env classesDeclarees mContraintes (* peut être pas vraiment ça pour tester cette égalité, à voir *)
	  	 	| ModifPlus  -> sousType y z env classesDeclarees mContraintes
	  	 	| ModifMinus -> sousType z y env classesDeclarees mContraintes
	  	 ) in
         lfor_all3 p listeTypeAbstraits l1 l2
    | c1(* *),     c2(* *) when fleche c1 c2 classesDeclarees -> let papaC1 = (*getClassFromType*) (typePere c1 classesDeclarees) in let typePapa = remplaceType papaC1 (construitSigma c1 l1 classesDeclarees) in sousType typePapa t2 env classesDeclarees mContraintes (*il faut maintenant calculer le type de papaC1 avec sigma *)(*on sait que c1 != c2 ici donc c1->c2 <=> pere(c1)->c2 *) (*peut bugger si on hérite de X[X], dans ce cas il faudrait pas remplacer le nom de la classe. *)
    | c1(* *),     c2      when Smap.mem c2 mContraintes -> List.exists (fun x -> sousType t1 x env classesDeclarees mContraintes) (Smap.find c2 mContraintes) (*je ne sais pas si on peut parler de max ici parce que je ne comprends pas C2>:t, donc on parcourt toutes les relations, mais il est possible que l'on puisse faire mieux*)
	| _ -> false
(* dans le dernier cas, C1 != Nothing donc C != Nothing et C!=Null donc on peut juste suivre les pères de "extends" *)
and eqTypes a b env classesDeclarees mContraintes = (sousType a b env classesDeclarees mContraintes) && (sousType b a env classesDeclarees mContraintes)

let bienForme typ = assert(false)

(* j'ai mis nawak pour les loc_expr et inter, à toi de voir. Mais ça compile *)
let rec type_expr env classesDeclarees membresClasse mContraintes loc_expr = match fst loc_expr with
	| Ecst(cst) -> basicType (match cst with
								| Cunit      -> "Unit"
								| Cint(a)    -> "Int"
								| Cbool(b)   -> "Boolean"
								| Cstring(s) -> "String"
							) env
	| Ethis -> basicType "this" env
	| Enull -> basicType "Null" env
	| Eaccess(lv) -> ( match lv with
					   | Lident(id, inter) -> if Smap.mem id env then Smap.find id env
					                   else type_expr env classesDeclarees membresClasse mContraintes (Eaccess(Laccess((Ethis,inter), id, inter)), inter)
					   | Laccess(ex, x, inter) -> let typeDeEx = type_expr env classesDeclarees membresClasse mContraintes ex in 
					   						let (nom_classe,b,ArgsType(listeTypePar)) = typeDeEx in
					   						let typeAbsX = getTypeAbstrait nom_classe x membresClasse in (*nom_classe.x*)
					   						remplaceType typeAbsX (construitSigma nom_classe listeTypePar classesDeclarees)
					)
	| Eaffect(lv,e,pos) -> ( (* let isConst = findIfConst lv in if isConst then failwith "non" else *)
							 let t1 = type_expr env classesDeclarees membresClasse mContraintes (Eaccess(lv), (fst (snd loc_expr), pos)) in
							 let t2 = type_expr env classesDeclarees membresClasse mContraintes e in
							 if sousType t1 t2 env classesDeclarees mContraintes then basicType "Unit" env else failwith "Affectation invalide."
						   )
	| Eunop(unop, expr) -> let t = type_expr env classesDeclarees membresClasse mContraintes expr in
							(match unop with
								| Uneg when eqTypes t (basicType "Int" env) env classesDeclarees mContraintes     -> t
								| Unot when eqTypes t (basicType "Boolean" env) env classesDeclarees mContraintes -> t
								| _ -> failwith "Opérateur unaire utilisé sur le mauvais type.")
	| Ebinop(binop, e1, e2, pos) -> let t1 = type_expr env classesDeclarees membresClasse mContraintes e1 in
							   let t2 = type_expr env classesDeclarees membresClasse mContraintes e2 in
							   let tb = (basicType "Boolean" env) in
							   (match binop with
							   | Beqphy|Bneqphy when sousType t1 (basicType "AnyRef" env) env classesDeclarees mContraintes && sousType t2 (basicType "AnyRef" env) env classesDeclarees mContraintes -> tb
							   | Beq|Bneq|Blt|Ble|Bgt|Bge when eqTypes t1 (basicType "Int" env) env classesDeclarees mContraintes && eqTypes t1 t2 env classesDeclarees mContraintes -> tb
							   | Badd|Bsub|Bmul|Bdiv|Bmod when eqTypes t1 (basicType "Int" env) env classesDeclarees mContraintes && eqTypes t1 t2 env classesDeclarees mContraintes -> basicType "Int" env
							   | Band|Bor when eqTypes t1 tb env classesDeclarees mContraintes && eqTypes t2 tb env classesDeclarees mContraintes -> tb
							   | _ -> failwith "opération binaire invalide."
							   )
	| Eprint(exp)           -> let t = type_expr env classesDeclarees membresClasse mContraintes exp in
								if eqTypes t (basicType "Int" env) env classesDeclarees mContraintes || eqTypes t (basicType "String" env) env classesDeclarees mContraintes then (basicType "Unit" env)
								else failwith "Invalid type of print argument."
	| Eif(e_cond, e_then, e_else) -> let t1 = type_expr env classesDeclarees membresClasse mContraintes e_cond in
									 let t2 = type_expr env classesDeclarees membresClasse mContraintes e_then in
									 let t3 = type_expr env classesDeclarees membresClasse mContraintes e_else in
									 if eqTypes t1 (basicType "Boolean" env) env classesDeclarees mContraintes && (sousType t2 t3 env classesDeclarees mContraintes || sousType t3 t2 env classesDeclarees mContraintes) then
									 ( if sousType t2 t3 env classesDeclarees mContraintes then t3 else t2 )
									 else
									 	failwith "Condition mal typée"
	| Ewhile(e_cond, e_corps) -> let t1 = type_expr env classesDeclarees membresClasse mContraintes e_cond in
								 let t2 = type_expr env classesDeclarees membresClasse mContraintes e_corps in
								 if eqTypes t1 (basicType "Boolean" env) env classesDeclarees mContraintes then basicType "Unit" env
								 else failwith "while mal typé"
    | Enew(nom_classe,args_type,(liste_locd_expr)) -> if not (bienForme (nom_classe, snd loc_expr,args_type)) then failwith "C[sigma] pas bien formé" else ((*TODO check que chacune des expr s'evalue en un type compatible avec args_type *) (nom_classe, snd loc_expr,args_type))
	(* | il manque un truc que je ne comprends pas ici, avec e.m[]() *)
	| Ereturn(exp) -> let rt = basicType "return" env in let t = type_expr env classesDeclarees membresClasse mContraintes exp in
						if sousType t rt env classesDeclarees mContraintes then basicType "Nothing" env
						else failwith "type de retour invalide"
	| Ebloc(liste_instruction) -> assert(false) (*match liste_instruction with
								| []   -> (basicType "Unit" env)
								| [Iexpr e]    -> (type_expr env classesDeclarees membresClasse mContraintes e)
								| (Iexpr e)::q -> (type_expr env classesDeclarees membresClasse mContraintes (Ebloc q, (snd (snd e), snd (snd locd_expr))))
								| (Ivar va)::q -> assert false (** TODO *)*)
	(*  | Ecall of left_value * args_type * (locd_expr list) *)
	| _ -> assert(false)

(*class B[X,Y] { }
class A[X] extends B[X, int] { }

class Vecteur[X] { }
class C2[X] { }
class C1[X] extends C2[Vecteur[X]] { }*)
