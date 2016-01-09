open X86_64
open Ast
open Format
open Typage

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 42
let sz = 8

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

let super_compteur = ref 0

(* Valeur de retour : 'a ast, le résultat se trouve en haut de pile *)
let rec compile_expr locd_exp env positionAlloc =
	match fst locd_exp with
	| Ecst(cst) -> pushq (getCstVal cst)
    | Ethis -> assert(false)(* ?? on est censé l'avoir en haut de la pile mais cet invariant n'est pas maintenable. TODO *)
    | Enull -> pushq (imm 0)
    | Eaccess(lv) ->
        (match lv with
            | Lident(ident,truc) ->
                if Smap.mem ident env
                then pushq (ind ~ofs:(Smap.find ident env) rsp)
	            else compile_expr (Eaccess(Laccess((Ethis, truc), ident, truc)), dummy_inter) env positionAlloc
            | Laccess(locd_expr,ident,_) -> 
	            (* coucou, TODO, alloue *)
	            let code = compile_expr locd_expr env positionAlloc in
                assert(false))
    | Eaffect(lv,locd_expr,_) -> assert(false)
    | Ecall(lv,args_type,lexp_list) -> assert(false)
    | Enew(nom_classe,args_type,lexp_list) -> let lcode = List.map (fun x -> compile_expr x env positionAlloc) lexp_list in
                                              let code = 
                                                (* TODO la taille de la classe *)
                                                movq (imm 40) (reg rdi) ++
                                                call "malloc" ++
                                                pushq (reg rax) ++
                                                (List.fold_left (fun c x -> c ++ x) (nop) lcode) ++
                                                call ("C_"^nom_classe) ++
                                                (List.fold_left (fun c x -> c ++ popq rax) (nop) lcode)
                                                (* pas le dernier pop *)
                                              in
                                              code
    | Eunop(unop, lexpr) -> assert(false)
    | Ebinop(binop,lexp1,lexp2,_)-> let v1 = compile_expr lexp1 env positionAlloc in let v2 = compile_expr lexp2 env positionAlloc in
                                    let codeLog = (match binop with
                                                | Bor -> (compile_expr (Eif(lexp1, (Ecst(Cbool(true)),dummy_inter), lexp2), dummy_inter) env positionAlloc)
                                                | Band -> (compile_expr (Eif(lexp1, lexp2, (Ecst(Cbool(false)),dummy_inter)), dummy_inter) env positionAlloc)
                                                | _ -> nop
                                                )
                                    in
                                    let code = if binop = Bor || binop = Band then nop else (v1 ++ v2 ++ popq rbx ++ popq rax ++ (
                                        match binop with
                                        | Badd -> addq (reg rbx) (reg rax)
                                        | Bsub -> subq (reg rbx) (reg rax)
                                        | Bmul -> imulq (reg rbx) (reg rax)
                                        | Bdiv -> cqto ++ idivq (reg rbx)
                                        | Bmod -> cqto ++ idivq (reg rbx) ++ movq (reg rdx) (reg rax)
                                        | Beq  -> subq (reg rbx) (reg rax) ++ sete (reg bl) ++ movzbq (reg bl) rax
                                        | Bneq -> subq (reg rbx) (reg rax) ++ setne (reg bl) ++ movzbq (reg bl) rax
                                        | Blt  -> subq (reg rbx) (reg rax) ++ sets (reg bl) ++ movzbq (reg bl) rax
                                        | Ble  -> subq (reg rax) (reg rbx) ++ setns (reg bl) ++ movzbq (reg bl) rax
                                        | Bgt  -> subq (reg rax) (reg rbx) ++ sets (reg bl) ++ movzbq (reg bl) rax
                                        | Bge  -> subq (reg rbx) (reg rax) ++ setns (reg bl) ++ movzbq (reg bl) rax
                                        | Beqphy -> subq (reg rbx) (reg rax) ++ sete (reg bl) ++ movzbq (reg bl) rax (* je crois que c'est exactement pareil que Beq*)
                                        | Bneqphy -> subq (reg rbx) (reg rax) ++ setne (reg bl) ++ movzbq (reg bl) rax
                                        | _ -> nop
                                        )
                                        ++ pushq (reg rax))
                                    in
                                    codeLog ++ code
    | Eif(lcond,lthen,lelse) -> let ccond = compile_expr lcond env positionAlloc in let cthen = compile_expr lthen env positionAlloc in let celse = compile_expr lelse env positionAlloc in
                                let magic_id = string_of_int (!super_compteur) in
                                super_compteur := (!super_compteur) + 1;
                                let code = 
                                    ccond ++
                                    popq rax ++
                                    movq (imm 1) (reg rbx) ++
                                    testq (reg rax) (reg rbx) ++
                                    je( "else_"^magic_id) ++
                                    cthen ++
                                    jmp ("end_"^magic_id) ++
                                    label ("else_"^magic_id) ++
                                    celse ++
                                    label ("end_"^magic_id)
                                in
                                code
    | Ewhile(lexpr, ldo) -> let ccond = compile_expr lexpr env positionAlloc in let cdo = compile_expr ldo env positionAlloc in
                            let magic_id = string_of_int (!super_compteur) in
                            super_compteur := (!super_compteur) + 1;
                            let code =
                                ccond ++
                                popq rax ++
                                movq (imm 1) (reg rbx) ++
                                testq (reg rax) (reg rbx) ++
                                je ("end_while_"^magic_id) ++
                                label ("cond_while_"^magic_id) ++
                                ccond ++
                                cdo ++
                                popq rax ++
                                popq rax ++
                                movq (imm 1) (reg rbx) ++
                                testq (reg rax) (reg rbx) ++
                                jne ("cond_while_"^magic_id) ++
                                label ("end_while_"^magic_id) ++
                                pushq (imm 0)
                            in
                            code
    | Ereturn(lexpr_ret) -> let v = compile_expr lexpr_ret env positionAlloc in
                            let code =
                                v ++ popq rax ++ popn positionAlloc ++ popq rbp ++ ret
                            in
                            code
    | Eprint(lexpr_print) -> let res = compile_expr lexpr_print env positionAlloc in
                             let code =
                                (* pushn place *)
                                res ++
                                popq rdi ++
                                (* popn place *)
                                call "print_int" ++
                                pushq (imm 0) (* unit *)
                             in
                             code
    | Ebloc(instruction_list) ->
        match instruction_list with
        | [] -> pushq (imm 0)
        | [Iexpr e] -> compile_expr e env positionAlloc
        | bidule::reste -> let c2 = compile_expr (Ebloc(reste), dummy_inter) env positionAlloc in (*normalement c pas env *)
                           let code = 
                             (match bidule with
                             | Idef(var) -> assert(false)
                             | Iexpr(locd_expr) -> let cc = compile_expr locd_expr env positionAlloc in cc) ++
                             popq rax ++
                             c2
                           in
                           code
        | _ -> pushq (imm 0)
    | _ -> assert(false)

let rec compileDecl_l classe pdecl_l newFun ordreVar debutConstruct = 
	match pdecl_l with
	| [] -> newFun, ordreVar,debutConstruct
	| a::b -> compileDecl classe a b newFun ordreVar debutConstruct
and compileDecl classe decl reste newFun ordreVar debutConstruct = 
	match decl with
    | Dvar(var) ->
        let (_, ident, _, expr, _) = var in
	    let ordreVar = Smap.add classe (ident::(Smap.find classe ordreVar)) ordreVar in
	    (* TODO : allouer de la place pour l'expression *)
	    let ce = compile_expr expr (Smap.empty) 0 in (*dans quoi mettre ça ?*) (*le res est en haut de la pile, mettons le dans rbx*)
	    let debutConstruct = debutConstruct ++ ce ++ popq rbx ++ (movq (reg rbx) (ind ~ofs:(8*(List.length (Smap.find classe ordreVar))) rsp)) in
	    (*TODO : libérer la place *)
	    compileDecl_l classe reste newFun ordreVar debutConstruct
    | Dmeth(methode) ->
        let (_,ident,ptl, pl, _ , expr, _) = methode in
		let env,decal = List.fold_left (fun (ev,nxt) x -> Smap.add x nxt ev, nxt+8) (Smap.empty, 16) (getPlNames pl) in
		let fpmax = 42 in (* TODO *)
        let ce = compile_expr expr env fpmax in
		let code = 
			label ("M_"^classe^"_"^ident) ++
		    pushq (reg rbp) ++
			movq (reg rsp) (reg rbp) ++ pushn fpmax ++
			ce ++ popq rax ++
			popn fpmax ++ popq rbp ++ ret
		in
		let newFun = newFun ++ code in
		compileDecl_l classe reste newFun ordreVar debutConstruct

let normalise map id = 
    if Smap.mem id map then map
    else
    Smap.add id [] map
	
let compile_class (codefun, codedesc, mMeth, ordreMeth, ordreVar) (Class(ident,_,ptcl,pl,(typ_pere, lexprl),pdecl_l)) = 
	let (idPere,_,_)=typ_pere in
	let ordreMeth = normalise ordreMeth idPere in
	let ordreVar = normalise ordreVar idPere in

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
	let newFun = constructFini ++ ret ++ newFun in

	newFun, newDesc, mMeth, newOrdreMeth, ordreVar

let compileMain classe = 
	let code = 
		movq (reg rsp) (reg rbp) ++
        (* TODO : allouer objet de classe Main et appeler main() *)
        movq (imm 40) (reg rdi) ++
        call "malloc" ++
        movq (reg rax) (reg r12) ++
        movq (ilab "D_Main") (ind ~ofs:0 r12) ++
        pushq (reg r12) ++
        call "M_Main_main" ++
        popq r12 ++
        movq (imm 0) (reg rax) ++ (* exit *)
        ret
        (*label "C_Main" ++
        (*constructeur classe main, genre, ret ?*)
        ret ++
        label "M_Main_main" ++
        pushq (reg rbp) ++
		movq (reg rsp) (reg rbp) ++
		movq (ind ~ofs:16 rbp) (reg rax) ++
        (* TODO *)
		popq rbp ++
        ret*)
	in
	code

let compile_program p ofile mMeth cmain =
  let codefun, codedesc, _, ordreMeth, ordreVar = List.fold_left compile_class (nop, nop, mMeth, Smap.empty, Smap.empty) (cmain::(fst p)) in
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
          ++ (label "D_AnyRef")
    }
  in
  let f = open_out ofile in
  let fmt = formatter_of_out_channel f in
  X86_64.print_program fmt p;
  fprintf fmt "@?";
  close_out f
