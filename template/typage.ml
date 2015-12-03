open Ast
open Parser
open Lexing

module Smap = Map.Make(String)
type env = (typ * bool) Smap.t (*string = ident *)
type typesAbstraitsParamClasse = ((ident * bool (* isConst *) * typ) list) Smap.t (* ident x typ *)
type classesDeclarees = clas Smap.t

(* env = (typ, bool) map[nom_variable] : le booleen est "isConst" *) 
(* mExTypes = type map[nom_de_classe] *)
(* typeParams = liste de types *) (* il faudrait map : nom_type_abstrait -> type_concret *)
(* membresClasse = (ident*bool*typ) map[nom_classe] contient une liste de ident*bool*type, ie "x", estConstant et type de classe.x *)
(* classesDeclarees associe à un nom de classe la classe *)
(* typeDeClasse qui représente un type abstrait, sauf dans les cas pré-définis. (==mExTypes) *)
(* en fait typeDeClasse ne peut exister et est inutile sauf pour les cas de base... *)

let getTypeAbstrait nom_classe nom_var membresClasse = (* doit renvoyer (type abstrait de classe.nom, isConst) *)
    let (id, iC, t) = (List.find (fun (id, iC, t) -> id=nom_var) (Smap.find nom_classe membresClasse))
    in (t, iC)

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

let typeExiste typ classesDeclarees =
    let (n,_,ArgsType(l)) = typ in 
    let Class(_,pl,_,_,_) = Smap.find n classesDeclarees in
    if List.length pl <> List.length l then false
    else true

let rec lfor_all3 p l1 l2 l3 = match l1,l2,l3 with
    | [], [], [] -> true
    | a::b, c::d, e::f -> p a c e && (lfor_all3 p b d f)
    | _ -> failwith "problème de taille de params, notre bug"

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

(** TODO : Nope. C'est pas ça. **)
let basicType name env = fst (Smap.find name env)

let getClassFromType typ classesDeclarees = 
    let (c:clas)=getClassFromName (getNameOfType typ) classesDeclarees in
    c

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

let rec sousType env classesDeclarees mContraintes t1 t2 =
    let estSousType = sousType env classesDeclarees mContraintes in
    let (c1,_,ArgsType(l1)) = t1 and (c2,_,ArgsType(l2)) = t2 in match c1, c2 with
    | "Nothing", _ -> true
    | "Null",    _ -> not (estSousType t2 (basicType "AnyVal" env))
    | c1(* *),     c2(* *) when c1=c2 ->
        let classeDeC1 = (Smap.find c1 classesDeclarees) in
        let Class(_,listeTypeAbstraits,_,_,_) = classeDeC1 in
        let p x y z = (
            match fst x with
            | ModifNone  -> eqTypes env classesDeclarees mContraintes y z (* peut être pas vraiment ça pour tester cette égalité, à voir *)
            | ModifPlus  -> estSousType y z
            | ModifMinus -> estSousType z y
        ) in
        lfor_all3 p listeTypeAbstraits l1 l2
    | c1(* *),     c2(* *) when fleche c1 c2 classesDeclarees -> let papaC1 = (*getClassFromType*) (typePere c1 classesDeclarees) in let typePapa = remplaceType papaC1 (construitSigma c1 l1 classesDeclarees) in estSousType typePapa t2 (*il faut maintenant calculer le type de papaC1 avec sigma *)(*on sait que c1 != c2 ici donc c1->c2 <=> pere(c1)->c2 *) (*peut bugger si on hérite de X[X], dans ce cas il faudrait pas remplacer le nom de la classe. *)
    | c1(* *),     c2      when Smap.mem c2 mContraintes -> List.exists (fun x -> estSousType t1 x) (Smap.find c2 mContraintes) (*je ne sais pas si on peut parler de max ici parce que je ne comprends pas C2>:t, donc on parcourt toutes les relations, mais il est possible que l'on puisse faire mieux*)
    | _ -> false
(* dans le dernier cas, C1 != Nothing donc C != Nothing et C!=Null donc on peut juste suivre les pères de "extends" *)
and eqTypes env classesDeclarees mContraintes a b =
    let estSousType = sousType env classesDeclarees mContraintes in
    (estSousType a b) && (estSousType b a)

let getListeParamsTypeFromClass classe =
    let Class(_,ptListe,_,_,_) = classe in
    List.map (fun x -> snd x) ptListe

let getNamePT x = match x with |PTsimple(n)|PTbigger(n,_)|PTsmaller(n,_)->n

let sigmaBienForme env classesDeclarees mContraintes listeParamsType mSigma =
    let estSousType = sousType env classesDeclarees mContraintes in
    let p x = 
        let tr = Smap.find (getNamePT x) mSigma in
        (
        match x with
        | PTbigger(nom_classe, typ)  -> estSousType tr (remplaceType typ mSigma)
        | PTsmaller(nom_classe, typ) -> estSousType (remplaceType typ mSigma) tr
        | _ -> true
        )
    in
    List.for_all p listeParamsType

let rec bienForme env classesDeclarees mContraintes typ =
    if not (typeExiste typ classesDeclarees) then false
    else
    (
        let (nom,_,ArgsType(params)) = typ in
        if not (List.for_all (fun x -> bienForme env classesDeclarees mContraintes x) params) then false
        else
        (
            let mSigma = construitSigma nom params classesDeclarees in
            let (classe:clas) = getClassFromType typ classesDeclarees in
            sigmaBienForme env classesDeclarees mContraintes (getListeParamsTypeFromClass classe) mSigma
        )
    )

(* j'ai mis nawak pour les loc_expr et inter, à toi de voir. Mais ça compile *)
let rec type_expr env classesDeclarees (membresClasse : typesAbstraitsParamClasse) mContraintes loc_expr =
    let estSousType = sousType env classesDeclarees mContraintes in
    let estEqTypes  = eqTypes  env classesDeclarees mContraintes in
    let appRec = type_expr env classesDeclarees membresClasse mContraintes in    
    match fst loc_expr with
    | Ecst(cst) -> basicType (match cst with
                                | Cunit      -> "Unit"
                                | Cint(a)    -> "Int"
                                | Cbool(b)   -> "Boolean"
                                | Cstring(s) -> "String"
                            ) env
    | Ethis -> fst (Smap.find "this" env)
    | Enull -> basicType "Null" env
    | Eaccess(lv) -> (match lv with
        | Lident(id, inter) ->
            if Smap.mem id env
            then fst (Smap.find id env)
            else appRec (Eaccess(Laccess((Ethis,inter), id, inter)), inter)
        | Laccess(ex, x, inter) ->
            let typeDeEx = appRec ex in 
            let (nom_classe,b,ArgsType(listeTypePar)) = typeDeEx in
            let typeAbsX = fst (getTypeAbstrait nom_classe x membresClasse) in (*nom_classe.x*)
            remplaceType typeAbsX (construitSigma nom_classe listeTypePar classesDeclarees)
        )
    | Eaffect(lv,e,pos) -> let t1 = (match lv with
        | Lident (id, inter)      ->
            if Smap.mem id env
            then
            (
                let (ty,isConst) = Smap.find id env in
                if isConst then failwith "Affectation d'une variable constante"
                else ty
            )
            else appRec (Eaccess(Laccess((Ethis,inter), id, inter)), inter)
        | Laccess(ex, x, inter) ->
            let typeDeEx = appRec ex in 
            let (nom_classe,b,ArgsType(listeTypePar)) = typeDeEx in
            let (typeAbsX, isConst) = getTypeAbstrait nom_classe x membresClasse in
            if isConst then failwith "Affectation d'une variable constante" else
            remplaceType typeAbsX (construitSigma nom_classe listeTypePar classesDeclarees)
        ) in 
        (* let t1 = appRec (Eaccess(lv), (fst (snd loc_expr), pos)) in *)
        let t2 = appRec e in
        if estSousType t2 t1 then basicType "Unit" env else failwith "Affectation invalide."
        
    | Eunop(unop, expr) ->
        let t = appRec expr in
        (match unop with
            | Uneg when estEqTypes t (basicType "Int" env)     -> t
            | Unot when estEqTypes t (basicType "Boolean" env) -> t
            | _ -> failwith "Opérateur unaire utilisé sur le mauvais type."
        )
    | Ebinop(binop, e1, e2, pos) ->
        let t1 = appRec e1 in
        let t2 = appRec e2 in
        let tb = (basicType "Boolean" env) in
        (match binop with
        | Beqphy|Bneqphy when estSousType t1 (basicType "AnyRef" env)
                           && estSousType t2 (basicType "AnyRef" env) -> tb
        | Beq|Bneq|Blt|Ble|Bgt|Bge when estEqTypes t1 (basicType "Int" env)
                                     && estEqTypes t1 t2 -> tb
        | Badd|Bsub|Bmul|Bdiv|Bmod when estEqTypes t1 (basicType "Int" env)
                                     && estEqTypes t1 t2 -> basicType "Int" env
        | Band|Bor when estEqTypes t1 tb && estEqTypes t2 tb -> tb
        | _ -> failwith "opération binaire invalide."
        )
    | Eprint (exp) ->
        let t = appRec exp in
        if estEqTypes t (basicType "Int" env)
        || estEqTypes t (basicType "String" env)
        then (basicType "Unit" env)
        else failwith "Invalid type of print argument."
    | Eif (e_cond, e_then, e_else) ->
        let t1 = appRec e_cond in
        let t2 = appRec e_then in
        let t3 = appRec e_else in
        if estEqTypes t1 (basicType "Boolean" env)
        && (estSousType t2 t3  || estSousType t3 t2)
        then ( if estSousType t2 t3 then t3 else t2 )
        else failwith "Condition mal typée"
    | Ewhile(e_cond, e_corps) ->
        let t1 = appRec e_cond in
        let _ = appRec e_corps in
        if estEqTypes t1 (basicType "Boolean" env)
        then basicType "Unit" env
        else failwith "while mal typé"
    | Enew(nom_classe,ArgsType(args_type),(liste_locd_expr)) ->
        if not (bienForme env classesDeclarees mContraintes (nom_classe, snd loc_expr,ArgsType(args_type)))
        then failwith "C[sigma] pas bien formé"
        else (
            let mSigma = construitSigma nom_classe args_type classesDeclarees in
            let comp x y =
                let t1 = appRec x in 
                estSousType t1 (remplaceType y mSigma)
            in if (List.for_all2 comp liste_locd_expr args_type) then
                (nom_classe, snd loc_expr,ArgsType(args_type))
            else failwith "new appelé avec des paramètres incompatibles"
            )
    (* | il manque un truc que je ne comprends pas ici, avec e.m[]() *)
    | Ecall(lv,ArgsType(args_type),liste_expr) ->
        let tClasse = appRec (Eaccess(lv), snd loc_expr) in assert(false)
    | Ereturn(exp) ->
        let rt = fst (Smap.find "return" env) in
        let t = appRec exp in
            if estSousType t rt
            then basicType "Nothing" env
            else failwith "type de retour invalide"
    | Ebloc(liste_instruction) ->
        (match liste_instruction with
            | []        -> (basicType "Unit" env)
            | [Iexpr e] -> (appRec e)
            | instr::q  -> let nextPo = snd (snd loc_expr) (* TODO décoration *) in
                type_expr (match instr with
                | Iexpr e -> env
                | Idef (isCst,name,typOpt,init,_) ->
                    (let typInit = appRec init in
                    match typOpt with
                        | None          -> Smap.add name (typInit, isCst) env
                        | Some typName  ->
                            if not(estSousType typInit typName) then
                                failwith "initialisation mal typée"
                            else
                                Smap.add name (typName, isCst) env
                    )
                          ) classesDeclarees membresClasse mContraintes (Ebloc (q), (nextPo (* TODO modifier le type Idef pour rajouter l'intervalle de définition *), snd (snd loc_expr)))
        )
    | _ -> assert(false)

let className classe = 
    let Class(n,_,_,_,_) = classe in n
let classParams classe =
    let Class(_,_,p,_,_) = classe in p

let listeTypeFromPTs liste = 
    List.map (fun x -> (getNamePT x, assert(false), ArgsType([]))) liste

let rec type_class env classesDeclarees membresClasse mContraintes classe = 
    let listeT = getListeParamsTypeFromClass classe in
    let checkTi (newCD, newConstraints) x =
        match x with
        | PTsimple(nom)        -> (Smap.add nom (Class(nom, [], [], (basicType "AnyRef" env, []), [])) newCD, newConstraints)
        | PTbigger(nom, typ)   -> if not (bienForme env classesDeclarees mContraintes typ) then failwith "mal formé" else (
                                    let nnCD = Smap.add nom (Class(nom, [], [], (basicType "AnyRef" env, []), [])) newCD in
                                    let nnCT = Smap.add nom ([typ]) newConstraints in
                                    (nnCD, nnCT)
                                    )
        | PTsmaller(nom, typ)  -> if not (bienForme env classesDeclarees mContraintes typ) then failwith "mal formé" else
                                    (Smap.add nom (Class(nom, [], [], (typ, []) , [])) newCD, newConstraints)
       in
    let newClassesDeclarees, newMContraintes = List.fold_left checkTi (classesDeclarees, mContraintes) listeT in
    let Class(_,_,_,(typPere, exp_list),_) = classe in
    let (tpName, _, ArgsType(tpList)) = typPere in
    if not (bienForme env newClassesDeclarees newMContraintes typPere) then failwith "hérite d'un type pas bien formé à l'étape 2"
    else(
        (* let newClassesDeclarees = (*ajouter la classe C à Gamma, ou Gamma' *) *)
        (* step 3*)
        let newEnv = List.fold_left (fun nEnv (nom, typ) -> if not (bienForme env newClassesDeclarees mContraintes typ) then failwith "fail etape 3" else Smap.add nom (typ, true) nEnv) (Smap.add "this" ((className classe, assert(false), ArgsType(listeTypeFromPTs listeT)), true) env) (classParams classe) in
        (*step 4*)
        let _ = type_expr newEnv newClassesDeclarees membresClasse newMContraintes (Enew(tpName, ArgsType(tpList), exp_list),assert(false)) in
        (*step 5*)
        assert(false)
    )

(*class B[X,Y] { }
class A[X] extends B[X, int] { }

class Vecteur[X] { }
class C2[X] { }
class C1[X] extends C2[Vecteur[X]] { }*)
