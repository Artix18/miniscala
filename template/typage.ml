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

let getTypeAbstrait nom classe membresClasse = (* doit renvoyer type abstrait de classe.nom *)
	snd (List.find (fun (x,y) -> x=nom) (Smap.find classe membresClasse))

(* ça a l'air bon, oui. *)
let getTypeConcret nom existingTypes typeParams = match nom with
	| nom when Smap.mem nom existingTypes                      -> Smap.find nom existingTypes
	| nom when List.exists (fun (x,y,z) -> x=nom) typeParams   -> (List.find (fun (x,y,z) -> x=nom) typeParams)
	| _ -> failwith "Cette classe n'existe pas."

(* il y a un gros bug ici mais je ne vois pas pourquoi. Le type de la fonction est scandaleux. *)
let rec getTypeVarDeClasseInstanciee t mExTy listeTypePar = 
	let (a,b,c)=(t : typ) in
	let (tAttribue, deco, arliste) = getTypeConcret a mExTy listeTypePar in
	let ArgsType(liste) = arliste in
	let ArgsType(param_abs) = c in
    let lres = List.map2 (fun tau1 tau2 -> let tt1 = getTypeVarDeClasseInstanciee tau1 mExTy listeTypePar in ((*if tt1 <> tau2 then failwith "Types incompatibles" else*) tt1)) param_abs liste in
	(tAttribue, deco, ArgsType(lres))

let lfor_all3 p l1 l2 l3 = 
	let rec aux l1 l2 l3 = match l1,l2,l3 with
		| [], [], [] -> true
		| a::b, c::d, e::f -> p a c e && (aux b d f)
	in
	let s1 = List.length l1 and s2 = List.length l2 and s3 = List.length l3 in
	if s1 <> s2 || s2 <> s3 then failwith "problème de taille de params, notre bug"
	else aux l1 l2 l3

let listeParamsAbstraits classe =
	let (_,listePTC,_,_,_)=classe in
	List.map (fun x -> let (_,pt)=x in match pt with |PTsimple(nom)|PTbigger(nom,_)|PTsmaller(nom,_) -> nom) 

let getNameOfType typ =
	let (n,_,_) = typ in n

let getClassFromName name classesDeclarees =
	(Smap.find name classesDeclarees)

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
	let nouveauNom = (if (Smap.mem name mSigma) then (Smap.find name mSigma) else name) in
	(nouveauNom, lol, ArgsType(List.map (fun x -> remplaceType x mSigma) l))

let rec sousType t1 t2 classesDeclarees typeDeClasse = let (c1,_,ArgsType(l1)) = t1 and (c2,_,ArgsType(l2)) = t2 in match c1, c2 with
	| "Nothing", _ -> true
	| "Null",    _ -> not (sousType t2 (Smap.find "AnyVal" typeDeClasse) classesDeclarees typeDeClasse)
	| c1(* *),     c2(* *) when c1=c2 
	  -> let classeDeC1 = (Smap.find c1 classesDeclarees) in let Class(_,listeTypeAbstraits,_,_,_) = classeDeC1 in
	  	 let p x y z = (
	  	 	match fst x with
	  	 	| ModifNone  -> eqTypes y z classesDeclarees typeDeClasse (* peut être pas vraiment ça pour tester cette égalité, à voir *)
	  	 	| ModifPlus  -> sousType y z classesDeclarees typeDeClasse
	  	 	| ModifMinus -> sousType z y classesDeclarees typeDeClasse
	  	 ) in
         lfor_all3 p listeTypeAbstraits l1 l2
	| c1(* *),     c2(* *) when fleche c1 c2 classesDeclarees -> let papaC1 = getClassFromType (typePere c1 classesDeclarees) classesDeclarees in let typePapa = determineTypeClasse papaC1 (construitMapAssociative (listeParamsAbstraits c1) l1) in sousType typePapa t2 (*il faut maintenant calculer le type de papaC1 avec sigma *)(*on sait que c1 != c2 ici donc c1->c2 <=> pere(c1)->c2 *)
	| c1(* *),     c2      -> (* *) assert(false)
	| _ -> false
(* dans le dernier cas, C1 != Nothing donc C != Nothing et C!=Null donc on peut juste suivre les pères de "extends" *)
and eqTypes a b classesDeclarees typeDeClasse = (sousType a b classesDeclarees typeDeClasse) && (sousType b a classesDeclarees typeDeClasse)

(* j'ai mis nawak pour les loc_expr et inter, à toi de voir. Mais ça compile *)
let rec type_expr env mExTy mMemClasse loc_expr = match fst loc_expr with
	| Ecst(cst) -> Smap.find (match cst with
								| Cunit      -> "Unit"
								| Cint(a)    -> "Int"
								| Cbool(b)   -> "Boolean"
								| Cstring(s) -> "String"
							) mExTy
	| Ethis -> Smap.find "this" env
	| Enull -> Smap.find "Null" mExTy (*TODO*)
	| Eaccess(lv) -> ( match lv with
					   | Lident(id, inter) -> if Smap.mem id env then Smap.find id env
					                   else type_expr env mExTy mMemClasse (Eaccess(Laccess((Ethis,inter), id, inter)), inter)
					   | Laccess(ex, id, inter) -> let typeDeEx = type_expr env mExTy mMemClasse ex in 
					   						let (a,b,c) = typeDeEx in
					   						let ArgsType(listeTypePar) = c in
					   						let classeDeEx = a in
					   						let typeAbsId = getTypeAbstrait id classeDeEx mMemClasse in
					   						getTypeVarDeClasseInstanciee typeAbsId mExTy listeTypePar (* TODO definir listeTypePar *)
					)
	| Eaffect(lv,e,pos) -> ( (* let isConst = findIfConst lv in if isConst then failwith "non" else *)
							 let t1 = type_expr env mExTy mMemClasse (Eaccess(lv), (fst (snd loc_expr), pos)) in
							 let t2 = type_expr env mExTy mMemClasse e in
							 if sousType t1 t2 then Smap.find "Unit" mExTy else failwith "Affectation invalide."
						   )
	| Eunop(unop, expr) -> let t = type_expr env mExTy mMemClasse expr in
							(match unop with
								| Uneg when eqTypes t (Smap.find "Int" mExTy) -> t
								| Unot when eqTypes t (Smap.find "Boolean" mExTy) -> t
								| _ -> failwith "Opérateur unaire utilisé sur le mauvais type.")
	| Ebinop(binop, e1, e2, pos) -> let t1 = type_expr env mExTy mMemClasse e1 in
							   let t2 = type_expr env mExTy mMemClasse e2 in
							   let tb = (Smap.find "Boolean" sExTy) in
							   (match binop with
							   | Beqphy|Bneqphy when sousType t1 (Smap.find "AnyRef" sExTy) && sousType t2 (Smap.find "AnyRef" sExTy)-> tb
							   | Beq|Bneq|Blt|Ble|Bgt|Bge when eqTypes t1 (Smap.find "Int" sExTy) && eqTypes t1 t2 -> tb
							   | Badd|Bsub|Bmul|Bdiv|Bmod when eqTypes t1 (Smap.find "Int" sExTy) && eqTypes t1 t2 ->Smap.find "Int" sExTy
							   | Band|Bor when eqTypes t1 tb && eqTypes t2 tb -> tb
							   | _ -> failwith "opération binaire invalide."
							   )
	| Eprint(exp)           -> let t = type_expr env mExTy mMemClasse exp in
								if eqTypes t (Smap.find "Int" sExTy) || eqTypes t (Smap.find "String" sExTy) then (Smap.find "Unit" sExTy)
								else failwith "Invalid type of print argument."
	| Eif(e_cond, e_then, e_else) -> let t1 = type_expr env mExTy mMemClasse e_cond in
									 let t2 = type_expr env mExTy mMemClasse e_then in
									 let t3 = type_expr env mExTy mMemClasse e_else in
									 if eqTypes t1 (Smap.find "Boolean" mExTy) && (sousType t2 t3 || sousType t3 t2) then
									 ( if sousType t2 t3 then t3 else t2 )
									 else
									 	failwith "Condition mal typée"
	| Ewhile(e_cond, e_corps) -> let t1 = type_expr env mExTy mMemClasse e_cond in
								 let t2 = type_expr env mExTy mMemClasse e_corps in
								 if eqTypes t1 (Smap.find "Boolean" mExTy) then Smap.find "Unit" mExTy
								 else failwith "while mal typé"
	| Enew(nom_classe,args_type,(liste_locd_expr)) -> if not (bien_forme (nom_classe, snd loc_expr,args_type)) then failwith "C[sigma] pas bien formé" else ((*TODO check que chacune des expr s'evalue en un type compatible avec args_type *) (nom_classe, snd loc_expr,ArgsType(args_type)))
	(* | il manque un truc que je ne comprends pas ici, avec e.m[]() *)
	| Ereturn(exp) -> let rt = Smap.find "return" env in let t = type_expr env mExTy mMemClasse exp in
						if sousType t rt then Smap.find "Nothing" mExTy
						else failwith "type de retour invalide"
	| Ebloc(liste_instruction) -> match liste_instruction with
								| []   -> (Smap.find "Unit" sExTy)
								| [Iexpr e]    -> (type_expr env mExTy mMemClasse e)
								| (Iexpr e)::q -> (type_expr env mExTy mMemClasse (Ebloc q, (snd (snd e), snd (snd locd_expr))))
								| (Ivar va)::q -> assert false (** TODO *)
	(*  | Ecall of left_value * args_type * (locd_expr list) *)
	| _ -> assert(false)

(*class B[X,Y] { }
class A[X] extends B[X, int] { }

class Vecteur[X] { }
class C2[X] { }
class C1[X] extends C2[Vecteur[X]] { }*)
