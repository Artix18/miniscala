open Ast
open Parser
open Lexing
open Printf

module Smap = Map.Make(String)
type env = (typ * bool) Smap.t (* string = ident, isConst *)
type typesAbstraitsParamClasse = ((ident * bool (* isConst *) * typ) list) Smap.t (* ident, est cst, typ *)
type classesDeclarees = clas Smap.t
type methodesClasses = (methode list) Smap.t

exception Param_error of string * interv
exception Unbound_error of string * interv
exception Type_error of string * interv

exception Sigma_error of string

let dummy_inter = (Lexing.dummy_pos, Lexing.dummy_pos)

let rec typeDisplay () ((nom_classe,_,ArgsType li) : typ) =
    let rec listDisplay () li = match li with
        | []   -> ""
        | [p]  -> Printf.sprintf "%a"    typeDisplay p
        | p::q -> Printf.sprintf "%a,%a" typeDisplay p listDisplay q
    in match li with
    | [] -> Printf.sprintf "%s" nom_classe
    | _  -> Printf.sprintf "%s[%a]" nom_classe listDisplay li



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

let basicType classesDeclarees name =
    let Class(_, lPTC, lP, typePere, lD) = (Smap.find name classesDeclarees) in
    let lT = List.map (fun idParam -> (idParam, dummy_inter, ArgsType [])) (lPAFromPTC lPTC) in
    (name, dummy_inter, ArgsType lT)

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
    let (name,inter,ArgsType(l)) = typ in
    if Smap.mem name mSigma then
    (
        if List.length l <> 0 then raise (Type_error (Printf.sprintf "Type %s is a parameter type, and thus can't take any parameter, but was given %d." name (List.length l), inter))
        else
            Smap.find name mSigma
    )
    else
        (name, inter, ArgsType(List.map (fun x -> remplaceType x mSigma) l))

let construitSigma nom_classe paramsConcrets classesDeclarees = 
    construitMapAssociative (listeParamsAbstraits (Smap.find nom_classe classesDeclarees)) paramsConcrets

let rec sousType classesDeclarees mContraintes t1 t2 =
    let estSousType = sousType classesDeclarees mContraintes in
    let realBasicType = basicType classesDeclarees in
    let (c1,_,ArgsType(l1)) = t1 and (c2,_,ArgsType(l2)) = t2 in match c1, c2 with
    | "Nothing", _ -> true
    | "Null",    _ -> not (estSousType t2 (realBasicType "AnyVal"))
    | c1(* *),     c2(* *) when c1=c2 ->
        let classeDeC1 = (Smap.find c1 classesDeclarees) in
        let Class(_,listeTypeAbstraits,_,_,_) = classeDeC1 in
        let p x y z = (
            match fst x with
            | ModifNone  -> eqTypes classesDeclarees mContraintes y z (* peut être pas vraiment ça pour tester cette egalite, à voir *)
            | ModifPlus  -> estSousType y z
            | ModifMinus -> estSousType z y
        ) in
        lfor_all3 p listeTypeAbstraits l1 l2
    | c1(* *),     c2(* *) when fleche c1 c2 classesDeclarees -> let papaC1 = (typePere c1 classesDeclarees) in let typePapa = remplaceType papaC1 (construitSigma c1 l1 classesDeclarees) in estSousType typePapa t2 (*il faut maintenant calculer le type de papaC1 avec sigma *)(*on sait que c1 != c2 ici donc c1->c2 <=> pere(c1)->c2 *) (*peut bugger si on herite de X[X], dans ce cas il faudrait pas remplacer le nom de la classe. *)
    | c1(* *),     c2      when Smap.mem c2 mContraintes -> List.exists (fun x -> estSousType t1 x) (Smap.find c2 mContraintes) (*je ne sais pas si on peut parler de max ici parce que je ne comprends pas C2>:t, donc on parcourt toutes les relations, mais il est possible que l'on puisse faire mieux*) (*TODO il n'y a qu'une seule contrainte par nom normalement *)
    | _ -> false
(* dans le dernier cas, C1 != Nothing donc C != Nothing et C!=Null donc on peut juste suivre les peres de "extends" *)
and eqTypes classesDeclarees mContraintes a b =
    let estSousType = sousType classesDeclarees mContraintes in
    (estSousType a b) && (estSousType b a)

let getListeParamsTypeFromClass classe =
    let Class(_,ptListe,_,_,_) = classe in
    List.map (fun x -> snd x) ptListe

let parConcret typ = let (a,b,ArgsType(c))=typ in c

let getNamePT x = match x with |PTsimple(n)|PTbigger(n,_)|PTsmaller(n,_)->n

let sigmaBienForme classesDeclarees mContraintes listeParamsType mSigma =
    let estSousType = sousType classesDeclarees mContraintes in
    let p x = 
        if not (Smap.mem (getNamePT x) mSigma) then failwith "type abstrait non défini dans sigma";
        let tr = Smap.find (getNamePT x) mSigma in
        match x with
        | PTbigger(nom_classe, typ)  -> let t_contr = (remplaceType typ mSigma) in
            if not (estSousType t_contr tr)
            then raise (Sigma_error (Printf.sprintf "type parameter %s was set to %a, but a superclass of %a was expected." nom_classe typeDisplay tr typeDisplay t_contr))
        | PTsmaller(nom_classe, typ) -> let t_contr = (remplaceType typ mSigma) in
            if not (estSousType tr t_contr)
            then raise (Sigma_error (Printf.sprintf "type parameter %s was set to %a, but a subclass of %a was expected." nom_classe typeDisplay tr typeDisplay t_contr))
        | _ -> ()
    in
    List.iter p listeParamsType

(* Idéalement, générer le message d'erreur directement ici *)
let rec bienForme classesDeclarees mContraintes ((nom,inter,ArgsType(params)) : typ) =
    if not (Smap.mem nom classesDeclarees) then raise (Unbound_error (Printf.sprintf "Type name %s doesn't exist." nom, inter));
    let Class(_, listePTC, _,_,_) = Smap.find nom classesDeclarees in
    if List.length listePTC <> List.length params then raise (Param_error (Printf.sprintf "Class %s expects %d type parameters, but was given %d." nom (List.length listePTC) (List.length params), inter));
    List.iter (fun x -> bienForme classesDeclarees mContraintes x; ()) params;
    let mSigma = construitSigma nom params classesDeclarees in
    let (classe:clas) = getClassFromType (nom,inter,ArgsType(params)) classesDeclarees in
    try
    sigmaBienForme classesDeclarees mContraintes (getListeParamsTypeFromClass classe) mSigma
    with Sigma_error s_err -> raise (Type_error (Printf.sprintf "For class %s, %s" nom s_err, inter))
    

let lvname lv = match lv with
    | Lident(ident,_) -> ident
    | Laccess(_,ident,_) -> ident

let compose sigma sigmaPrime = (*sigma rond sigmaPrime*)
    let fus k x y = match x,y with
        | _, Some _ -> y
        | _         -> x
    in
    Smap.merge fus sigma sigmaPrime

let checkMeth nom_classe meth methC =
    let (lv, ArgsType(args_type),liste_expr) = meth in
    let Laccess (exp, mname, inter) = lv in
    if not (Smap.mem nom_classe methC)
        then raise (Unbound_error ("Class " ^ nom_classe ^ " has no method, thus no method named " ^ mname ^ ".", (fst(snd exp), snd inter)));
    
    let p x = let (_,name,_,_,_,_,_)=x in name=mname
    in
    if not (List.exists p (Smap.find nom_classe methC))
        then raise (Unbound_error ("Class " ^ nom_classe ^ " has no method named " ^ mname ^ ".", (fst(snd exp), snd inter)));
    let methode = List.find p (Smap.find nom_classe methC) in
    let (_,_,ptl,pl,rv,_,_) = methode in
    if List.length ptl <> List.length args_type
        then raise (Param_error (Printf.sprintf "Method %s.%s expects %d type parameters, but was given %d." nom_classe mname (List.length ptl) (List.length args_type), (fst(snd exp), snd inter)));
    
    if List.length pl <> List.length liste_expr
        then raise (Param_error (Printf.sprintf "Method %s.%s expects %d parameters, but was given %d." nom_classe mname (List.length pl) (List.length liste_expr), (fst(snd exp), snd inter)));
    
    (ptl, pl, rv)

let getIdentLv lv = match lv with   | Lident(ident,_)|Laccess(_,ident,_)->ident

(* j'ai mis nawak pour les loc_expr et inter, à toi de voir. Mais ça compile *)
let rec type_expr env classesDeclarees membresClasse mContraintes methC loc_expr =
    let estSousType = sousType    classesDeclarees mContraintes in
    let estEqTypes  = eqTypes     classesDeclarees mContraintes in
    let appRec   = type_expr env  classesDeclarees membresClasse mContraintes methC in 
    let estBF    = bienForme      classesDeclarees mContraintes in
    let realBasicType = basicType classesDeclarees in
    match fst loc_expr with
    | Ecst(cst) -> realBasicType (match cst with
                                | Cunit      -> "Unit"
                                | Cint(a)    -> "Int"
                                | Cbool(b)   -> "Boolean"
                                | Cstring(s) -> "String"
                            )
    | Ethis -> fst (Smap.find "this" env)
    | Enull -> realBasicType "Null"
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
            else raise (Unbound_error (Printf.sprintf "Class %s has no field named %s." nom_classe x, inter))
        )
    | Eaffect(Lident (id, inter), e, pos) when not (Smap.mem id env) -> appRec (Eaffect(Laccess((Ethis,inter), id, inter),e,pos), inter)
    | Eaffect(lv,e,pos) -> let t1 = (match lv with
        | Lident (id, inter)      ->
            let (ty,isConst) = Smap.find id env in
            if isConst then raise (Type_error (Printf.sprintf "Local value %s is constant." id, inter))
            else ty
        | Laccess(ex, x, inter) ->
            let typeDeEx = appRec ex in 
            let (nom_classe,b,ArgsType(listeTypePar)) = typeDeEx in
            let (typeAbsX, isConst) = getTypeAbstrait nom_classe x membresClasse in
            if isConst then raise (Type_error (Printf.sprintf "Field %s.%s is constant." nom_classe x, inter))
            else remplaceType typeAbsX (construitSigma nom_classe listeTypePar classesDeclarees)
        ) in 
        (* let t1 = appRec (Eaccess(lv), (fst (snd loc_expr), pos)) in *)
        let t2 = appRec e in
        if estSousType t2 t1 then realBasicType "Unit"
        else raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be castable to %a." typeDisplay t2 typeDisplay t1), snd e))
        
    | Eunop(unop, expr) ->
        let t = appRec expr in
        (match unop with
            | Uneg -> if estEqTypes t (realBasicType "Int") then t
                      else raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be Int." typeDisplay t), snd expr))
            | Unot -> if estEqTypes t (realBasicType "Boolean") then t
                      else raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be Boolean." typeDisplay t), snd expr))
        )
    | Ebinop(binop, e1, e2, pos) ->
        let t1 = appRec e1 in
        let t2 = appRec e2 in
        let tb = (realBasicType "Boolean") in
        (match binop with
        | Beqphy|Bneqphy when estSousType t1 (realBasicType "AnyRef")
                           && estSousType t2 (realBasicType "AnyRef") -> tb
        | Beq|Bneq|Blt|Ble|Bgt|Bge when estEqTypes t1 (realBasicType "Int")
                                     && estEqTypes t1 t2 -> tb
        | Badd|Bsub|Bmul|Bdiv|Bmod when estEqTypes t1 (realBasicType "Int")
                                     && estEqTypes t1 t2 -> realBasicType "Int"
        | Band|Bor when estEqTypes t1 tb && estEqTypes t2 tb -> tb
        | _ -> failwith "operation binaire invalide. Flemme."
        )
    | Eprint (exp) ->
        let t = appRec exp in
        if estEqTypes t (realBasicType "Int")
        || estEqTypes t (realBasicType "String")
        then (realBasicType "Unit")
        else raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be Int or String." typeDisplay t), snd exp))
    | Eif (e_cond, e_then, e_else) ->
        let t1 = appRec e_cond in
        if not (estEqTypes t1 (realBasicType "Boolean"))
            then raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be Boolean." typeDisplay t1), snd e_cond)) else
        let t2 = appRec e_then in
        let t3 = appRec e_else in
        if (estSousType t2 t3  || estSousType t3 t2)
        then ( if estSousType t2 t3 then t3 else t2 )
        else if fst e_else == Ecst Cunit
            then raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be Unit." typeDisplay t2), snd e_then))
            else raise (Type_error ((Printf.sprintf "These expressions have incompatible types %a and %a." typeDisplay t2 typeDisplay t3), (fst(snd e_then),snd(snd e_else)) ))
    | Ewhile(e_cond, e_corps) ->
        let t = appRec e_cond in
        let _ = appRec e_corps in
        if estEqTypes t (realBasicType "Boolean")
        then realBasicType "Unit"
        else raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be Boolean." typeDisplay t), snd e_cond))
    | Enew(nom_classe,ArgsType(args_type),(liste_locd_expr)) ->
        estBF (nom_classe, snd loc_expr,ArgsType(args_type));
        let mSigma = construitSigma nom_classe args_type classesDeclarees in
        let Class (nom_classe, typesParamTheo, paramTheo, _,_) = Smap.find nom_classe classesDeclarees in
        let checkType e y =
            let t1 = appRec e in
            let t2 = (remplaceType (snd y) mSigma) in
            if not (estSousType t1 t2)
            then raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be castable to %a." typeDisplay t1 typeDisplay t2), snd e))
        in if (List.length liste_locd_expr <> List.length paramTheo)
        then raise (Param_error ((Printf.sprintf "Class %s's constructor expects %d parameters, but was given %d" nom_classe (List.length paramTheo) (List.length liste_locd_expr)), dummy_inter (** TODO *) ))
        else
            List.iter2 checkType liste_locd_expr paramTheo;
            (nom_classe, snd loc_expr,ArgsType(args_type))
    (* | il manque un truc que je ne comprends pas ici, avec e.m[]() *)
    | Ecall(lv,ArgsType(args_type),liste_expr) ->

        (*(try
        let tClasse = appRec (Eaccess(lv), snd loc_expr) in ()
        with | _ -> print_string (getIdentLv lv); failwith "ici");*)
        
        let Laccess(lvexp, nom_meth,inter) = lv in
        
        let tClasse = appRec lvexp in

        let nom_classe = getNameOfType tClasse in
        let tAbs, tPar, rv = checkMeth nom_classe (lv, ArgsType(args_type),liste_expr) methC in (
        List.iter estBF args_type;
        let sigma = construitSigma nom_classe (parConcret tClasse) classesDeclarees in
        let sigmaPrime = construitMapAssociative (lPAFromPT tAbs) args_type in
        let compo = compose sigma sigmaPrime in
        (try
        sigmaBienForme classesDeclarees mContraintes tAbs compo;
        with Sigma_error s_err -> raise (Type_error (Printf.sprintf "For method %s.%s, %s" nom_classe nom_meth s_err, inter)));
        
        let checkSousTypage ex y =
            let tex = appRec ex in
            let tref = remplaceType (snd y) compo in
            if not (estSousType tex tref)
            then raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be castable to %a." typeDisplay tex typeDisplay tref), snd ex))
        in
        List.iter2 checkSousTypage liste_expr tPar;
        remplaceType rv compo
        )
        
    | Ereturn(exp) ->
        let rt = fst (Smap.find "return" env) in
        let t = appRec exp in
        if estSousType t rt
        then realBasicType "Nothing"
        else raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be castable to %a." typeDisplay t typeDisplay rt), snd exp))
    | Ebloc(liste_instruction) ->
        (match liste_instruction with
            | []        -> (realBasicType "Unit")
            | [Iexpr e] -> (appRec e)
            | instr::q  -> let nextPo = ref (snd (snd loc_expr)) in
                type_expr (match instr with
                | Iexpr (e, (d,finVar))                      -> nextPo := finVar; let _ = appRec (e,(d,finVar)) in env
                | Idef  (isCst,name,typOpt,init,(_, finVar)) -> nextPo := finVar;
                    (let typInit = appRec init in
                    match typOpt with
                        | None          -> Smap.add name (typInit, isCst) env
                        | Some typName  -> estBF typName;
                            if not(estSousType typInit typName) then
                                raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be castable to %a." typeDisplay typInit typeDisplay typName), snd init))
                            else
                                Smap.add name (typName, isCst) env
                    )
                          ) classesDeclarees membresClasse mContraintes methC (Ebloc (q), (!nextPo, snd (snd loc_expr)))
        )
   
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

let enlevePtlASigma ptl sigma = 
    Smap.filter (fun x y -> not (List.mem x ptl)) sigma

let appliqueSigmaAPl sigma pl = 
    List.map (fun (a,typ) -> (a, remplaceType typ sigma)) pl

let ajouteMethode nom_classe methode methC = 
    if Smap.mem nom_classe methC then Smap.add nom_classe (methode::(Smap.find nom_classe methC)) methC
    else Smap.add nom_classe [methode] methC

let ajouteMemClasse nom_pere nom_classe mMem sigma = 
    let appli_sigma (ident,isCst,typ) = 
        (ident, isCst, remplaceType typ sigma)
    in
    if Smap.mem nom_pere mMem then Smap.add nom_classe (List.map appli_sigma (Smap.find nom_pere mMem)) mMem
    else mMem

let ajouteMethClasse nom_pere nom_classe mMeth sigma = 
    let appli_sigma (do_over, ident, ptl, pl, typ, locd_expr, interv) =
        (*je crois qu'on peut appliquer bêtement sigma à pl et typ. Mais il faut retirer ceux de ptl *)
        let sigmaPrime = enlevePtlASigma (lPAFromPT ptl) sigma in
        ((do_over, ident, ptl, appliqueSigmaAPl sigmaPrime pl, remplaceType typ sigmaPrime, locd_expr, interv):methode)
    in
    if Smap.mem nom_pere mMeth then Smap.add nom_classe (List.map appli_sigma (Smap.find nom_pere mMeth)) mMeth
    else mMeth

let retire map nom = 
    Smap.filter (fun key _ -> key <> nom) map

let extendTenTprimeStep1 classesDeclarees mContraintes membresClasse methC listeT =
    let realBasicType = basicType classesDeclarees in
    let checkTi (newCD, newConstraints, newMembresClasse, newMethC) x =
        match x with
        | PTsimple(nom)        -> (Smap.add nom (Class(nom, [], [], (realBasicType "Any", []), [])) newCD, retire newConstraints nom, retire newMembresClasse nom, retire newMethC nom)
        | PTbigger(nom, typ)   -> bienForme newCD newConstraints typ;
                                  let nnCD = Smap.add nom (Class(nom, [], [], (realBasicType "Any", []), [])) newCD in
                                  let nnCT = Smap.add nom ([typ]) newConstraints in
                                  (nnCD, nnCT, retire newMembresClasse nom, retire newMethC nom)
        | PTsmaller(nom, typ)  -> bienForme newCD newConstraints typ;
                                  let nnCD = Smap.add nom (Class(nom, [], [], (typ, []) , [])) newCD in
                                  let (tpName, _, ArgsType(tpList)) = typ in
                                  
                                  let ptitSigma = construitSigma tpName tpList newCD in
                                  
                                  let nnMC = ajouteMemClasse tpName nom newMembresClasse ptitSigma in
                                  let nnMethC = ajouteMethClasse tpName nom newMethC ptitSigma in
                                  (nnCD, retire newConstraints nom, nnMC, nnMethC)
       in
    List.fold_left checkTi (classesDeclarees, mContraintes, membresClasse, methC) listeT

let extendStep3 env nCD mCT listeParams =
    List.fold_left (fun nEnv (nom, typ) -> bienForme nCD mCT typ; Smap.add nom (typ, true) nEnv) env listeParams

let ajouteVarConstruct nom_classe parList membresClasse = 
    let transforme pl =
        List.map (fun (a,b) -> (a,true,b)) pl
    in
    let rec fusion l1 l2 = (*l1 ecrase l2, comme ça les params constructeurs ecrasent l'heritage.*)
        match l2 with
        | [] -> l1
        | a::b -> if List.mem a l1 then fusion l1 b else fusion (a::l1) b
    in
    let lToAdd = transforme parList in
    if Smap.mem nom_classe membresClasse then
        let l = (Smap.find nom_classe membresClasse) in
        Smap.add nom_classe (fusion lToAdd l) membresClasse
    else
        Smap.add nom_classe lToAdd membresClasse

let rec type_class classesDeclarees membresClasse mContraintes methC classe = 
    let rvCd = ref classesDeclarees in
    let rvMembresClasse = ref membresClasse in
    let rvMethC = ref methC in
    let listeT = getListeParamsTypeFromClass classe in

    (*step 1*)
    let newClassesDeclarees, newMContraintes, membresClasse, methC = extendTenTprimeStep1 classesDeclarees mContraintes membresClasse methC listeT in
    
    (*step 2*)
    let Class(nom_classe,_,_,(typPere, exp_list),liste_decl) = classe in
    let (tpName, _, ArgsType(tpList)) = typPere in
    bienForme newClassesDeclarees newMContraintes typPere;
 
    (*let newClassesDeclarees = (*ajouter la classe C à Gamma *) *)
    rvCd := Smap.add nom_classe classe (!rvCd);

    (* il faut ajouter tous les trucs du pere de classe à Gamma *)
    
    let ptitSigma = construitSigma tpName tpList classesDeclarees in (*clDecl ou newClDecl ne devrait rien changer ?*)
    
    rvMembresClasse := ajouteMemClasse tpName nom_classe (!rvMembresClasse) ptitSigma;
    rvMethC := ajouteMethClasse tpName nom_classe (!rvMethC) ptitSigma;
    
    let newClassesDeclarees = Smap.add nom_classe classe newClassesDeclarees in
    let membresClasse       = ajouteMemClasse  tpName nom_classe membresClasse ptitSigma in
    let methC               = ajouteMethClasse tpName nom_classe methC ptitSigma in

    (* step 3*)
    let newEnv = (Smap.add "this" ((className classe, dummy_inter, ArgsType(listeTypeFromPTs listeT)), true) Smap.empty) in
    
    let membresClasse = ajouteVarConstruct nom_classe (classParams classe) membresClasse in
    rvMembresClasse := ajouteVarConstruct nom_classe (classParams classe) (!rvMembresClasse);

    (*step 4*)
    let _ = type_expr newEnv newClassesDeclarees membresClasse newMContraintes methC (Enew(tpName, ArgsType(tpList), exp_list),dummy_inter) in

    (*step 5*)
    let type_decl megaEnv decl = 
        let (newClassesDeclarees, newMembresClasse, newMContraintes, newMethC) = megaEnv in
        match decl with
        | Dvar(var) -> let resTyp = type_expr newEnv newClassesDeclarees newMembresClasse newMContraintes newMethC (Ebloc([Idef(var); Iexpr(Eaccess(Lident(varName var,dummy_inter)), dummy_inter)]),dummy_inter) in
                       let nnMCl = ajouteMembre newMembresClasse nom_classe (varName var, varConst var, resTyp) in
                       rvMembresClasse := ajouteMembre (!rvMembresClasse) nom_classe (varName var, varConst var, resTyp);
                       (newClassesDeclarees, nnMCl, newMContraintes, newMethC) (*TODO check si je le fais bien *)
        | Dmeth(methode) -> let (do_override,ident,param_type_list,param_list,typRet,locd_expr,interv) = methode in
                            let nnCD,nnMCT,newMembresClasse,newMethC=extendTenTprimeStep1 newClassesDeclarees newMContraintes newMembresClasse newMethC param_type_list in
                  
                            let nnEnv = extendStep3 newEnv nnCD nnMCT param_list in (*not found ici *)
                            let nnEnv = Smap.add "return" (typRet,true) nnEnv in
                            
                            let nnMethC = ajouteMethode nom_classe methode newMethC in
                            rvMethC := ajouteMethode nom_classe methode (!rvMethC);
                            
                            let s_t = (type_expr nnEnv nnCD newMembresClasse nnMCT nnMethC locd_expr) in
                            if not (sousType nnCD nnMCT s_t typRet)
                            then raise (Type_error ((Printf.sprintf "This expression has type %a, but was expected to be castable to %a." typeDisplay s_t typeDisplay typRet), snd locd_expr))
                            else (** TODO : check override **)(newClassesDeclarees, newMembresClasse, newMContraintes, nnMethC)
    in
    let _ = List.fold_left type_decl (newClassesDeclarees, membresClasse, newMContraintes, methC) liste_decl in
    (!rvCd, !rvMembresClasse, !rvMethC)

(*main n'a pas le droit de s'instancier elle-même. TODO *)
let typeMain classesDeclarees membresClasse mContraintes methC classe =
    type_class classesDeclarees membresClasse mContraintes methC (Class("Main", [], [], (basicType classesDeclarees "AnyVal", []), classe))

let makeBC nom_classe nom_pere classesDeclarees =
    Class(nom_classe, [], [], (basicType classesDeclarees nom_pere, []), [])

let getDefaultCl = 
    let classes = Smap.add "Any" (Class("Any", [], [], (("Any",dummy_inter, ArgsType []), []), [])) Smap.empty in
    let classes = Smap.add "AnyVal"  (makeBC "AnyVal"  "Any"    classes) classes in
    let classes = Smap.add "AnyRef"  (makeBC "AnyRef"  "Any"    classes) classes in
    let classes = Smap.add "Unit"    (makeBC "Unit"    "AnyVal" classes) classes in
    let classes = Smap.add "Int"     (makeBC "Int"     "AnyVal" classes) classes in
    let classes = Smap.add "Boolean" (makeBC "Boolean" "AnyVal" classes) classes in
    let classes = Smap.add "String"  (makeBC "String"  "AnyRef" classes) classes in
    let classes = Smap.add "Null"    (makeBC "Null"    "String" classes) classes in
    let classes = Smap.add "Nothing" (makeBC "Nothing" "Null"   classes) classes in
    let classes = Smap.add "Array"   (Class("Array", [(ModifNone, PTsimple("T"))], [], (basicType classes "AnyRef",[]),[])) classes in
    classes

let typeFichier f =
    let mContraintes = Smap.empty in
    let clDecl = getDefaultCl in
    let memCl = Smap.empty in
    let methC = Smap.empty in
    let rec typeRecCl curClDecl curMemCl curMethC l = (match l with
    | [] -> typeMain curClDecl curMemCl mContraintes curMethC (snd f)
    | p::q -> let nCD,nMC,nMethC = type_class curClDecl curMemCl mContraintes curMethC p in typeRecCl nCD nMC nMethC q)
    in typeRecCl clDecl memCl methC (fst f); ()

(* sigma : T -> vector<bool> vector<vector<bool>, vector2<int>, B> *)

(*class B[X,Y] { }
class A[X] extends B[X, int] { }

class Vecteur[X] { }
class C2[X] { }
class C1[X] extends C2[Vecteur[X]] { }*)
