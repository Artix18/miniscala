open Ast
open Parser
open Lexing

module Smap = Map.Make(String)
type env = (typ * bool) Smap.t (*string = ident *)
type typesAbstraitsParamClasse = ((ident * bool (* isConst *) * typ) list) Smap.t (* ident, est cst, typ *)
type classesDeclarees = clas Smap.t
type methodesClasses = (methode list) Smap.t

let dummy_inter = (Lexing.dummy_pos, Lexing.dummy_pos)

(* env = (typ, bool) map[nom_variable] : le booleen est "isConst" *) 
(* membresClasse = (ident*bool*typ) map[nom_classe] contient une liste de ident*bool*type, ie "x", estConstant et type de classe.x *)
(* classesDeclarees associe à un nom de classe la classe *)
(* methodesClasses contient une liste des methodes *)
(* mContraintes : liste des contraintes >: *)

let getTypeAbstrait nom_classe nom_var membresClasse = (* doit renvoyer (type abstrait de classe.nom, isConst) *)
    let (id, iC, t) = (List.find (fun (id, iC, t) -> id=nom_var) (Smap.find nom_classe membresClasse))
    in (t, iC)

let possedeMembre nom_classe nom_var membresClasse = 
    if not (Smap.mem nom_classe membresClasse) then false
    else List.exists (fun (id, iC, t) -> id=nom_var) (Smap.find nom_classe membresClasse)

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
    | _ -> failwith "probleme de taille de params, notre bug"

let lPAFromPTC listePTC =
    List.map (fun x -> let (_,pt)=x in match pt with |PTsimple(nom)|PTbigger(nom,_)|PTsmaller(nom,_) -> nom) listePTC 
let lPAFromPT listePT =
    List.map (fun pt -> match pt with |PTsimple(nom)|PTbigger(nom,_)|PTsmaller(nom,_) -> nom) listePT 

let listeParamsAbstraits classe =
    let Class(_,listePTC,_,_,_)=classe in
    lPAFromPTC listePTC

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
    let (name,pos,ArgsType(l)) = typ in
    if Smap.mem name mSigma then
    (
        if List.length l <> 0 then failwith "Un type abstrait ne peut pas prendre de parametre."
        else
            Smap.find name mSigma
    )
    else
        (name, pos, ArgsType(List.map (fun x -> remplaceType x mSigma) l))
    (*let nouveauNom = (if (Smap.mem name mSigma) then getNameOfType (Smap.find name mSigma) else name)
    (nouveauNom, lol, ArgsType(List.map (fun x -> remplaceType x mSigma) l))*)

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
            | ModifNone  -> eqTypes env classesDeclarees mContraintes y z (* peut être pas vraiment ça pour tester cette egalite, à voir *)
            | ModifPlus  -> estSousType y z
            | ModifMinus -> estSousType z y
        ) in
        lfor_all3 p listeTypeAbstraits l1 l2
    | c1(* *),     c2(* *) when fleche c1 c2 classesDeclarees -> let papaC1 = (*getClassFromType*) (typePere c1 classesDeclarees) in let typePapa = remplaceType papaC1 (construitSigma c1 l1 classesDeclarees) in estSousType typePapa t2 (*il faut maintenant calculer le type de papaC1 avec sigma *)(*on sait que c1 != c2 ici donc c1->c2 <=> pere(c1)->c2 *) (*peut bugger si on herite de X[X], dans ce cas il faudrait pas remplacer le nom de la classe. *)
    | c1(* *),     c2      when Smap.mem c2 mContraintes -> List.exists (fun x -> estSousType t1 x) (Smap.find c2 mContraintes) (*je ne sais pas si on peut parler de max ici parce que je ne comprends pas C2>:t, donc on parcourt toutes les relations, mais il est possible que l'on puisse faire mieux*)
    | _ -> false
(* dans le dernier cas, C1 != Nothing donc C != Nothing et C!=Null donc on peut juste suivre les peres de "extends" *)
and eqTypes env classesDeclarees mContraintes a b =
    let estSousType = sousType env classesDeclarees mContraintes in
    (estSousType a b) && (estSousType b a)

let getListeParamsTypeFromClass classe =
    let Class(_,ptListe,_,_,_) = classe in
    List.map (fun x -> snd x) ptListe

let parConcret typ = let (a,b,ArgsType(c))=typ in c

let getNamePT x = match x with |PTsimple(n)|PTbigger(n,_)|PTsmaller(n,_)->n

let sigmaBienForme env classesDeclarees mContraintes listeParamsType mSigma =
    let estSousType = sousType env classesDeclarees mContraintes in
    let p x = 
        if not (Smap.mem (getNamePT x) mSigma) then failwith "type abstrait non défini dans sigma"
        else(
        let tr = Smap.find (getNamePT x) mSigma in
        (
        match x with
        | PTbigger(nom_classe, typ)  -> estSousType tr (remplaceType typ mSigma)
        | PTsmaller(nom_classe, typ) -> estSousType (remplaceType typ mSigma) tr
        | _ -> true
        )
        )
    in
    List.for_all p listeParamsType

(* Idéalement, générer le message d'erreur directement ici *)
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

let lvname lv = match lv with
    | Lident(ident,_) -> ident
    | Laccess(_,ident,_) -> ident

let compose sigma sigmaPrime = (*sigma rond sigmaPrime*)
    let fus k x y = match x,y with
        | _, Some b -> Some b
        | Some a, None -> Some a
    in
    Smap.merge fus sigma sigmaPrime

let checkMeth nom_classe meth methC =
    let (lv, ArgsType(args_type),liste_expr) = meth in
    let mname = lvname lv in
    if not (Smap.mem nom_classe methC) then failwith "cette methode n'existe pas (ni aucune dans cette classe, d'ailleurs)."
    else(
    let p x = let (_,name,_,_,_,_,_)=x in name=mname
    in
    if not (List.exists p (Smap.find nom_classe methC)) then failwith "cette methode n'existe pas."
    else (
    let methode : methode = List.find p (Smap.find nom_classe methC) in
    let ((_,_,ptl,pl,rv,_,_):methode) = methode in
    if List.length ptl <> List.length args_type then failwith "probleme taille liste t1,...,tk"
    else(
    if List.length pl <> List.length liste_expr then failwith "probleme taille liste e1,...,en"
    else (
        (ptl, pl, rv)
    )
    )
    )
    )

let getIdentLv lv = match lv with   | Lident(ident,_)|Laccess(_,ident,_)->ident

(* j'ai mis nawak pour les loc_expr et inter, à toi de voir. Mais ça compile *)
let rec type_expr env classesDeclarees (membresClasse : typesAbstraitsParamClasse) mContraintes methC loc_expr =
    let estSousType = sousType env classesDeclarees mContraintes in
    let estEqTypes  = eqTypes  env classesDeclarees mContraintes in
    let appRec = type_expr env classesDeclarees membresClasse mContraintes methC in 
    let estSigBF = sigmaBienForme env classesDeclarees mContraintes in   
    let estBF    = bienForme env classesDeclarees mContraintes in
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
            if possedeMembre nom_classe x membresClasse then (
            let typeAbsX = fst (getTypeAbstrait nom_classe x membresClasse) in (*nom_classe.x*)
            remplaceType typeAbsX (construitSigma nom_classe listeTypePar classesDeclarees)
            )
            else failwith "on ne devrait pas gerer les appels de classes ou autres ici. La variable nom_classe.x n'existe pas"
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
            | _ -> failwith "Operateur unaire utilise sur le mauvais type."
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
        | _ -> failwith "operation binaire invalide."
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
        else failwith "Condition mal typee"
    | Ewhile(e_cond, e_corps) ->
        let t1 = appRec e_cond in
        let _ = appRec e_corps in
        if estEqTypes t1 (basicType "Boolean" env)
        then basicType "Unit" env
        else failwith "while mal type"
    | Enew(nom_classe,ArgsType(args_type),(liste_locd_expr)) ->
        if not (bienForme env classesDeclarees mContraintes (nom_classe, snd loc_expr,ArgsType(args_type)))
        then failwith "C[sigma] pas bien forme"
        else (
            let mSigma = construitSigma nom_classe args_type classesDeclarees in
            let comp x y =
                let t1 = appRec x in 
                estSousType t1 (remplaceType y mSigma)
            in if (List.for_all2 comp liste_locd_expr args_type) then
                (nom_classe, snd loc_expr,ArgsType(args_type))
            else failwith "new appele avec des parametres incompatibles"
            )
    (* | il manque un truc que je ne comprends pas ici, avec e.m[]() *)
    | Ecall(lv,ArgsType(args_type),liste_expr) ->

        (*(try
        let tClasse = appRec (Eaccess(lv), snd loc_expr) in ()
        with | _ -> print_string (getIdentLv lv); failwith "ici");*)
        
        let Laccess(lvexp, _,_) = lv in
        
        let tClasse = appRec lvexp in

        let nom_classe = getNameOfType tClasse in
        let tAbs, tPar, rv = checkMeth nom_classe (lv, ArgsType(args_type),liste_expr) methC in
        if not (List.for_all (fun x -> estBF x) args_type) then failwith "params_type pas bien formes"
        else(
        let sigma = construitSigma nom_classe (parConcret tClasse) classesDeclarees in
        let sigmaPrime = construitMapAssociative (lPAFromPT tAbs) args_type in
        let compo = compose sigma sigmaPrime in
        if not (estSigBF tAbs compo) then failwith "composition mal formee"
        else(
        let ok = List.for_all2 (fun x y -> let tpp = appRec x in estSousType tpp (remplaceType (snd y) compo)) liste_expr tPar in
        if not ok then failwith "sous-typage error"
        else
            remplaceType rv compo
        )
        )
        
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
            | instr::q  -> let nextPo = ref (snd (snd loc_expr)) in
                type_expr (match instr with
                | Iexpr (e, (_,finVar))                      -> nextPo := finVar; env
                | Idef  (isCst,name,typOpt,init,(_, finVar)) -> nextPo := finVar;
                    (let typInit = appRec init in
                    match typOpt with
                        | None          -> Smap.add name (typInit, isCst) env
                        | Some typName  ->
                            if not(estSousType typInit typName) then
                                failwith "initialisation mal typee"
                            else
                                Smap.add name (typName, isCst) env
                    )
                          ) classesDeclarees membresClasse mContraintes methC (Ebloc (q), (!nextPo, snd (snd loc_expr)))
        )
    | _ -> assert(false)
   
let varName var = 
    let (_,name,_,_,_)=var in
    name

let varConst var = 
    let (iscst,_,_,_,_)=var in
    iscst

let className classe = 
    let Class(n,_,_,_,_) = classe in n
let classParams classe =
    let Class(_,_,p,_,_) = classe in p

let listeTypeFromPTs liste = 
    List.map (fun x -> (getNamePT x, dummy_inter, ArgsType([]))) liste

let ajouteMembre membresClasse nom_classe nouveau = 
    if Smap.mem nom_classe membresClasse then Smap.add nom_classe (nouveau::(Smap.find nom_classe membresClasse)) membresClasse
    else Smap.add nom_classe [nouveau] membresClasse

let extendTenTprimeStep1 env classesDeclarees mContraintes listeT = 
    let checkTi (newCD, newConstraints) x =
        match x with
        | PTsimple(nom)        -> (Smap.add nom (Class(nom, [], [], (basicType "AnyRef" env, []), [])) newCD, newConstraints)
        | PTbigger(nom, typ)   -> if not (bienForme env classesDeclarees mContraintes typ) then failwith "mal forme" else (
                                    let nnCD = Smap.add nom (Class(nom, [], [], (basicType "AnyRef" env, []), [])) newCD in
                                    let nnCT = Smap.add nom ([typ]) newConstraints in
                                    (nnCD, nnCT)
                                    )
        | PTsmaller(nom, typ)  -> if not (bienForme env classesDeclarees mContraintes typ) then failwith "mal forme" else
                                    (Smap.add nom (Class(nom, [], [], (typ, []) , [])) newCD, newConstraints)
       in
    List.fold_left checkTi (classesDeclarees, mContraintes) listeT

let extendStep3 env nCD mCT listeParams =
    List.fold_left (fun nEnv (nom, typ) -> if not (bienForme env nCD mCT typ) then failwith "fail etape 3" else Smap.add nom (typ, true) nEnv) env listeParams

let ajouteMethode nom_classe methode methC = 
    if Smap.mem nom_classe methC then Smap.add nom_classe (methode::(Smap.find nom_classe methC)) methC
    else Smap.add nom_classe [methode] methC

let ajouteMemClasse nom_pere nom_classe mMem = 
    if Smap.mem nom_pere mMem then Smap.add nom_classe (Smap.find nom_pere mMem) mMem
    else mMem

let ajouteMethClasse nom_pere nom_classe mMeth = 
    if Smap.mem nom_pere mMeth then Smap.add nom_classe (Smap.find nom_pere mMeth) mMeth
    else mMeth

let rec type_class env classesDeclarees membresClasse mContraintes methC classe = 
    let rvCd = ref classesDeclarees in
    let rvMembresClasse = ref membresClasse in
    let rvMethC = ref methC in
    let listeT = getListeParamsTypeFromClass classe in
    (*let checkTi (newCD, newConstraints) x =
        match x with
        | PTsimple(nom)        -> (Smap.add nom (Class(nom, [], [], (basicType "AnyRef" env, []), [])) newCD, newConstraints)
        | PTbigger(nom, typ)   -> if not (bienForme env classesDeclarees mContraintes typ) then failwith "mal forme" else (
                                    let nnCD = Smap.add nom (Class(nom, [], [], (basicType "AnyRef" env, []), [])) newCD in
                                    let nnCT = Smap.add nom ([typ]) newConstraints in
                                    (nnCD, nnCT)
                                    )
        | PTsmaller(nom, typ)  -> if not (bienForme env classesDeclarees mContraintes typ) then failwith "mal forme" else
                                    (Smap.add nom (Class(nom, [], [], (typ, []) , [])) newCD, newConstraints)
       in
    let newClassesDeclarees, newMContraintes = List.fold_left checkTi (classesDeclarees, mContraintes) listeT in*)
    (*step1*)
    let newClassesDeclarees, newMContraintes = extendTenTprimeStep1 env classesDeclarees mContraintes listeT in
    let Class(nom_classe,_,_,(typPere, exp_list),liste_decl) = classe in
    let (tpName, _, ArgsType(tpList)) = typPere in
    if not (bienForme env newClassesDeclarees newMContraintes typPere) then failwith "herite d'un type pas bien forme à l'etape 2"
    else(
        (*let newClassesDeclarees = (*ajouter la classe C à Gamma *) *)
        rvCd := Smap.add nom_classe classe (!rvCd);
        (* il faut ajouter tous les trucs du pere de classe à Gamma *)
        (* mais pas à Gamma' pour eviter qu'une classe s'appelle elle même. Mais du coup il faut pouvoir appeler les fonctions du pere*)
        (*en fait si, mais il faut faire gaffe à remplacer t avec les params de C...*)
        rvMembresClasse := ajouteMemClasse tpName nom_classe (!rvMembresClasse);
        rvMethC := ajouteMethClasse tpName nom_classe (!rvMethC);
        
        let newClassesDeclarees = Smap.add nom_classe classe newClassesDeclarees in
        let membresClasse       = ajouteMemClasse tpName nom_classe membresClasse in
        let methC               = ajouteMethClasse tpName nom_classe methC in
        (* step 3*)
        (*let newEnv = List.fold_left (fun nEnv (nom, typ) -> if not (bienForme env newClassesDeclarees mContraintes typ) then failwith "fail etape 3" else Smap.add nom (typ, true) nEnv) (Smap.add "this" ((className classe, assert(false), ArgsType(listeTypeFromPTs listeT)), true) env) (classParams classe) in*)
        let newEnv = extendStep3 (Smap.add "this" ((className classe, dummy_inter, ArgsType(listeTypeFromPTs listeT)), true) env) newClassesDeclarees mContraintes (classParams classe) in
        (*step 4*)
        let _ = type_expr newEnv newClassesDeclarees membresClasse newMContraintes methC (Enew(tpName, ArgsType(tpList), exp_list),dummy_inter) in
        (*step 5*)
        let type_decl megaEnv decl = 
            let (newEnv, newClassesDeclarees, newMembresClasse, newMContraintes, newMethC) = megaEnv in
            match decl with
            | Dvar(var) -> let resTyp = type_expr newEnv newClassesDeclarees newMembresClasse newMContraintes newMethC (Ebloc([Idef(var)]),dummy_inter) in let nnMCl = ajouteMembre newMembresClasse nom_classe (varName var, varConst var, resTyp) in
                           rvMembresClasse := ajouteMembre (!rvMembresClasse) nom_classe (varName var, varConst var, resTyp);
                            (newEnv, newClassesDeclarees, nnMCl, newMContraintes, newMethC)
            | Dmeth(methode) -> let (do_override,ident,param_type_list,param_list,typ,locd_expr,interv) = methode in
                                let nnCD,nnMCT=extendTenTprimeStep1 newEnv newClassesDeclarees newMContraintes param_type_list in
                      
                                let nnEnv = extendStep3 newEnv nnCD nnMCT param_list in (*not found ici *)
                                
                                let nnMethC = ajouteMethode nom_classe methode newMethC in
                                rvMethC := ajouteMethode nom_classe methode (!rvMethC);
                                
                                if not (sousType nnEnv nnCD nnMCT (type_expr nnEnv nnCD newMembresClasse nnMCT nnMethC locd_expr) typ) then failwith "probleme step5"
                                else (** TODO : check override **)(nnEnv, nnCD, newMembresClasse, nnMCT, nnMethC)
        in
        let _ = List.fold_left type_decl (newEnv, newClassesDeclarees, membresClasse, newMContraintes, methC) liste_decl in
        (!rvCd, !rvMembresClasse, !rvMethC)
    )

(*main n'a pas le droit de s'instancier elle-même. TODO *)
let typeMain env classesDeclarees membresClasse mContraintes methC classe = 
    type_class env classesDeclarees membresClasse mContraintes methC (Class("Main", [], [], (basicType "AnyVal" env, []), classe))

let getDefaultEnv = 
    let res = Smap.empty in
    let res = Smap.add "Any" (("Any",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "AnyVal" (("AnyVal",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "AnyRef" (("AnyRef",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "Unit" (("Unit",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "Int" (("Int",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "Boolean" (("Boolean",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "String" (("Any",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "Null" (("Null",dummy_inter,ArgsType([])),true) res in
    let res = Smap.add "Nothing" (("Nothing",dummy_inter,ArgsType([])),true) res in
    res

let makeBC nom_classe nom_pere env =
    Class(nom_classe, [], [], (basicType nom_pere env, []), [])

let getDefaultCl env = 
    let res = Smap.empty in
    let res = Smap.add "Any" (makeBC "Any" "Any" env) res in
    let res = Smap.add "AnyVal" (makeBC "AnyVal" "Any" env) res in
    let res = Smap.add "AnyRef" (makeBC "AnyRef" "Any" env) res in
    let res = Smap.add "Unit" (makeBC "Unit" "AnyVal" env) res in
    let res = Smap.add "Int" (makeBC "Int" "AnyVal" env) res in
    let res = Smap.add "Boolean" (makeBC "Boolean" "AnyVal" env) res in
    let res = Smap.add "String" (makeBC "String" "AnyRef" env) res in
    let res = Smap.add "Null" (makeBC "Null" "String" env) res in
    let res = Smap.add "Nothing" (makeBC "Nothing" "Null" env) res in
    let res = Smap.add "Array" (Class("Array", [(ModifNone, PTsimple("T"))], [], (basicType "AnyVal" env,[]),[])) res in
    res

let typeFichier f =
    let mContraintes = Smap.empty in
    let env = getDefaultEnv in
    let clDecl = getDefaultCl env in
    let memCl = Smap.empty in
    let methC = Smap.empty in
    let rec typeRecCl curClDecl curMemCl curMethC l = (match l with
    | [] -> typeMain env curClDecl curMemCl mContraintes curMethC (snd f)
    | p::q -> let nCD,nMC,nMethC = type_class env curClDecl curMemCl mContraintes curMethC p in typeRecCl nCD nMC nMethC q)
    in typeRecCl clDecl memCl methC (fst f); ()

(* sigma : T -> vector<bool> vector<vector<bool>, vector2<int>, B> *)

(*class B[X,Y] { }
class A[X] extends B[X, int] { }

class Vecteur[X] { }
class C2[X] { }
class C1[X] extends C2[Vecteur[X]] { }*)
