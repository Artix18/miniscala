open X86_64
open Ast
open Format
open Typage

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

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
		) ++
		ret
	in
	res

let getPlNames pl =
	List.map fst pl

let compile_expr exp env = 
	nop

let rec compileDecl_l classe pdecl_l newFun ordreVar = 
	assert(false);
	match pdecl_l with
	| [] -> newFun, ordreVar
	| a::b -> compileDecl classe a b newFun ordreVar
and compileDecl classe decl reste newFun ordreVar = 
	match decl with
    | Dvar(var) -> let (_, ident, _, exp, _) = var in
    				let ordreVar = Smap.add classe (ident::(Smap.find classe ordreVar)) ordreVar in
    				(* TODO : allouer de la place pour l'expression *)
    				compile_expr exp (Smap.empty); (*dans quoi mettre ça ?*)
    				(*TODO : libérer la place *)
    				compileDecl_l classe reste newFun ordreVar
    | Dmeth(methode) -> let (_,ident,ptl, pl, _ , expr, _) = methode in
    					let env,decal = List.fold_left (fun (ev,nxt) x -> Smap.add x nxt ev, nxt+8) (Smap.empty, 16) (getPlNames pl) in
    					let cexp = compile_expr exp env in
    					(* TODO compiler la méthode ici *)
    					compileDecl_l classe reste newFun ordreVar
	
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
	let newFun = (compileConstruct ident plnames (8+(List.length lpere)*8)) in
	let newFun,ordreVar = compileDecl_l ident pdecl_l newFun ordreVar in
	let newFun = newFun ++ codefun in

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
        (Hashtbl.fold (fun x _ l -> label x ++ dquad [1] ++ l) genv
          (label ".Sprint_int" ++ string "%d\n" ++ label ".Sprint_string" ++ string "%s\n"))
          ++ codedesc
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f
