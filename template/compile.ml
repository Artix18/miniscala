open X86_64
open Ast
open Format
open Typage

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 42
let SZ = 8

let liste_str = ref []

module Smap = Map.Make(String)

type local_env = ident Smap.t

let popn n = addq (imm n) (reg rsp)
let pushn n = subq (imm n) (reg rsp)

let compile_decl codefun decl =
	assert(false)

let isOver meth = 
	let over,_,_,_,_,_,_ = meth in
	over

let getMethName meth = 
	let _,name,_,_,_,_,_ = meth in
	name

let estMethDe nom classeId mMeth = 
	List.exists (fun x -> x = nom) (List.map getMethName (Smap.find classeId mMeth))

let nonOverMeth mMeth ident = 
	List.map getMethName (List.filter isOver (Smap.find ident mMeth))

(* c'est pas mMeth qu'il faut mais une map avec uniquement les méthodes de la classe et pas celles de ses parents *)
let rec ajouteMethADesc mMeth (ident:string) idPere (listeMeth:string list) =
	match listeMeth with
	| [] -> let l = (nonOverMeth mMeth ident) in l,(List.fold_left (fun m x -> address [("M_"^ident^"_"^x)] ++ m) (nop) l)
	| a::b -> let lm,c = ajouteMethADesc mMeth ident idPere b in 
        a::lm, (address ([if estMethDe a ident mMeth then "M_"^ident^"_"^a else "M_"^idPere^"_"^a])) ++ c
	
let compileConstruct ident plnames debutTas =
	(*il me semble que la pile contient directement les args en bas à décal + 16. On sq l'objet est en haut de la pile *)
	let debutPile = 16 in 
	let res = 
		label ("C_"^ident) ++
        (fst (List.fold_left (fun (c,decal) x -> (movq (ind ~ofs:(debutPile+decal) rbp) (ind ~ofs:(debutTas+decal) rsp)) ++ c, decal+8) (nop, 0) plnames)
		)
	in
	res

let getPlNames pl =
	List.map fst pl

let getCstVal cst = match cst with
  | Cunit -> imm 0
  | Cint(res) -> imm res (*sur 64 bits, il va falloir remplacer tous les 8 par des 64 -> ah non, pas du tout, my bad *)
  | Cbool(b) -> imm (if b then 1 else 0)
  | Cstring(str) -> liste_str := str::(!liste_str); ilab ("str_"^(string_of_int (List.length (!liste_str))))

let compile_expr exp env = 
	match fst exp with
	| Ecst(cst) -> pushq (getCstVal cst)
    | Ethis -> assert(false)(* ?? on est censé l'avoir en haut de la pile mais cet invariant n'est pas maintenable. TODO *)
    | Enull -> imm 0
    | Eaccess(lv) -> match lv with
    				| Lident(ident,truc) -> if Smap.mem ident env then pushq (ind ~ofs:(Smap.find ident env) rsp) 
    										else compile_expr Eaccess(Laccess((Ethis, truc), ident, truc)) env
 					| Laccess(locd_expr,ident,_) -> 
 											(* coucou, TODO, alloue *)
 											let code = compile_expr locd_expr env in
 											
    | Eaffect(lv,locd_expr,_) -> assert(false)
    | Ecall(lv,args_type,lexp_list) -> assert(false)
    | Enew(lv, nom_classe,args_type,lexp_list) -> assert(false)
    | Eunop(unop, lexpr) -> assert(false)
    | Ebinop(binop,lexp1,lexp2,_)-> assert(false)
    | Eif(lcond,lthen,lelse) -> assert(false)
    | Ewhile(lexpr, ldo) -> assert(false)
    | Ereturn(lexpr_ret) -> assert(false)
    | Eprint(lexpr_print) -> assert(false)
    (*| Ebloc of instruction list*)
    | _ -> nop

let rec compileDecl_l classe pdecl_l newFun ordreVar debutConstruct = 
	match pdecl_l with
	| [] -> newFun, ordreVar,debutConstruct
	| a::b -> compileDecl classe a b newFun ordreVar debutConstruct
and compileDecl classe decl reste newFun ordreVar debutConstruct = 
	match decl with
    | Dvar(var) -> let (_, ident, _, expr, _) = var in
    				let ordreVar = Smap.add classe (ident::(Smap.find classe ordreVar)) ordreVar in
    				(* TODO : allouer de la place pour l'expression *)
    				let ce = compile_expr expr (Smap.empty) in (*dans quoi mettre ça ?*) (*le res est en haut de la pile, mettons le dans rbx*)
    				let debutConstruct = debutConstruct ++ ce ++ popq rbx ++ (movq (reg rbx) (ind ~ofs:(8*(List.length (Smap.find classe ordreVar))) rsp)) in
    				(*TODO : libérer la place *)
    				compileDecl_l classe reste newFun ordreVar debutConstruct
    | Dmeth(methode) -> let (_,ident,ptl, pl, _ , expr, _) = methode in
    					let env,decal = List.fold_left (fun (ev,nxt) x -> Smap.add x nxt ev, nxt+8) (Smap.empty, 16) (getPlNames pl) in
    					let fpmax = 42 in (* TODO *)
                        let ce = compile_expr expr env in
    					let code = 
    						label ("M_"^classe^"_"^ident) ++
    					    pushq (reg rbp) ++
      						movq (reg rsp) (reg rbp) ++ pushn fpmax ++
      						ce ++ popq rax ++
      						popn fpmax ++ popq rbp ++ ret
      					in
      					let newFun = newFun ++ code in
    					compileDecl_l classe reste newFun ordreVar debutConstruct
	
let compile_class (codefun, codedesc, mMeth, ordreMeth, ordreVar) (Class(ident,_,ptcl,pl,(typ_pere, lexprl),pdecl_l)) = 
	let (idPere,_,_)=typ_pere in
	let lm, cd = (ajouteMethADesc mMeth ident idPere (Smap.find idPere ordreMeth)) in
	let newDesc = 
		label ("D_"^ident) ++ address [("D_"^idPere)] ++ cd ++ codedesc
	in
	let newOrdreMeth = Smap.add ident lm ordreMeth in

	let lpere = (Smap.find idPere ordreVar) in
	let plnames = (getPlNames pl) in
	let ordreVar = Smap.add ident (lpere @ plnames) ordreVar in
	(*Attention, les vars d'une classe sont allouées sur le tas*)
	let debutConstruct = (compileConstruct ident plnames (8+(List.length lpere)*8)) in
    let newFun,ordreVar,constructFini = compileDecl_l ident pdecl_l codefun ordreVar debutConstruct in
	let newFun = constructFini ++ ret ++ newFun ++ codefun in

	newFun, newDesc, mMeth, newOrdreMeth, ordreVar

let compileMain classe = 
	assert(false);
	let code = 
		movq (reg rsp) (reg rbp) ++
        (* TODO : allouer objet de classe Main et appeler main() *)
        movq (imm 0) (reg rax) ++ (* exit *)
        ret ++
        label "C_Main" ++
        (*constructeur classe main, genre, ret ?*)
        ret ++
        label "M_Main_main" ++
        pushq (reg rbp) ++
		movq (reg rsp) (reg rbp) ++
		movq (ind ~ofs:16 rbp) (reg rax) ++
		(* mettre la fonction ici *)
		popq rbp ++
        ret
	in
	code

let compile_program p ofile mMeth =
  let codefun, codedesc, _, ordreMeth, ordreVar = List.fold_left compile_class (nop, nop, mMeth, Smap.empty, Smap.empty) (fst p) in
  let codemain = compileMain (snd p) in
  let p =
    { text =
        glabel "main" ++
        codemain++
        (* codemain contient aussi les trucs de la classe main *)

        label "print_int" ++
        movq (reg rdi) (reg rsi) ++
        movq (ilab ".Sprint_int") (reg rdi) ++
        movq (imm 0) (reg rax) ++
        call "printf" ++
        ret ++

		label "print_string" ++
		movq (reg rdi) (reg rsi) ++
		movq (ilab ".Sprint_string") (reg rdi) ++
		movq (imm 0) (reg rax) ++
		call "printf" ++
		ret ++
        codefun;
        
      data =
        fst (List.fold_left (fun (code,nb) x -> label ("str_"^(string_of_int nb)) ++ string x ++ code, nb-1)
        ((label ".Sprint_int" ++ string "%d\n" ++ label ".Sprint_string" ++ string "%s\n"),(List.length (!liste_str))) (!liste_str))
          ++ codedesc
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f
