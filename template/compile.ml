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

let super_compteur = ref 0

let dummy_typ = ("dummy", dummy_inter, ArgsType([]))

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

let rec compileConstruct ident idPere expr_pere plnames decalTas ordreVar ordreMeth =
	(*il me semble que la pile contient directement les args en bas à décal + 24 (en effet, à +8 rbp saved, à +16 adr retour). On sq l'objet est en bas de la pile *)
	let posTas = 8*(List.length plnames)+24 in
	let debutPile = 16 in (*j'aurais dit 24 mais ça marche que avec 16*)
	let res = 
		label ("C_"^ident) ++
		pushq (reg rbp) ++
		movq (reg rsp) (reg rbp) ++
		
		(*on empile this et les arguments du construct du pere et on l'appelle*)
		pushq (ind ~ofs:(posTas) rbp) ++
		(List.fold_left (fun c x -> c++(compile_expr x Smap.empty 0 ordreVar ordreMeth)) nop expr_pere) ++
		call ("C_"^idPere) ++
		(*TODO : continuer ce que j'ai commencé ici *)
		popn (8+8*(List.length expr_pere)) ++ (*pop this et les arguments*)

		movq (ind ~ofs:(posTas) rbp) (reg rax) ++ (*decalage sur le tas : +8 car il y a le desc de classe, +8*nbVarParents=decalTas *)
		movq (reg rax) (reg r14) ++
        (fst (List.fold_left (fun (c,decal) x -> (movq (ind ~ofs:(debutPile+decal) rbp) (reg rbx)) ++ (movq (reg rbx) (ind ~ofs:(8+8*(combienIeme x (Smap.find ident ordreVar))) rax)) ++ c, decal+8) (nop, 0) (List.rev plnames))
		)
	in
	res

and getPlNames pl =
	List.map fst pl

and estInt (nomTyp,_,_) = (nomTyp="Int")

and getCstVal cst = match cst with
  | Cunit -> imm 0
  | Cint(res) -> imm res (*sur 64 bits, il va falloir remplacer tous les 8 par des 64 -> ah non, pas du tout, my bad *)
  | Cbool(b) -> imm (if b then 1 else 0)
  | Cstring(str) -> liste_str := str::(!liste_str); ilab (".str_"^(string_of_int (List.length (!liste_str))))

and combienIeme id liste = 
	match liste with
	| [] -> assert(false)
	| p::q -> if p=id then 0 else 1+(combienIeme id q)

(* Valeur de retour : 'a ast, le résultat se trouve en haut de pile *)
and compile_expr typd_exp env positionAlloc ordreVar ordreMeth =
	match fst typd_exp with
	| PEcst(cst) -> pushq (getCstVal cst)
    | PEthis -> let posThis = Smap.find "this" env in
                let code = 
                    pushq (ind ~ofs:posThis rbp) (*on aura un truc du genre 16(rbp) pour this*)
                in
                code
    | PEnull -> pushq (imm 0)
    | PEaccess(lv) ->
        (match lv with
            | PLident(ident) ->
                if Smap.mem ident env
                then pushq (ind ~ofs:(Smap.find ident env) rbp)
	            else assert(false) (*compile_expr (PEaccess(PLaccess((PEthis), ident)), dummy_inter) env positionAlloc*) (*je crois qu'on a pas besoin*)
            | PLaccess(typd_expr,ident) -> 
	            (* coucou, TODO, alloue *)
	            let ce = compile_expr typd_expr env positionAlloc ordreVar ordreMeth in
	            let (nom_classe, _,_) = (snd typd_expr) in
                let code = 
                    ce ++
                    popq rbx ++
                    movq (ind ~ofs:(8+8*(combienIeme ident (Smap.find nom_classe ordreVar))) rbx) (reg rax) ++
                    pushq (reg rax)
                in
                code)
    | PEaffect(lv,typd_expr) -> assert(false)
    | PEcall(lv,args_type,lexp_list) -> assert(false)
    | PEnew(ptyp,lexp_list) -> let (nom_classe,_,_)=ptyp in let lcode = List.map (fun x -> compile_expr x env positionAlloc ordreVar ordreMeth) lexp_list in
                                              let code = 
                                                (* TODO la taille de la classe *)
                                                movq (imm (16+8*(List.length (Smap.find nom_classe ordreVar)))) (reg rdi) ++
                                                call "malloc" ++
                                                movq (ilab ("D_"^nom_classe)) (ind ~ofs:0 rax) ++ (*met le descripteur de classe, pas sûr*)
                                                pushq (reg rax) ++
                                                (List.fold_left (fun c x -> c ++ x) (nop) lcode) ++
                                                call ("C_"^nom_classe) ++
                                                (List.fold_left (fun c x -> c ++ popq rax) (nop) lcode)
                                                (* pas le dernier pop *)
                                              in
                                              code
    | PEunop(unop, lexpr) -> let ce = compile_expr lexpr env positionAlloc ordreVar ordreMeth in
                            let code = 
                              (match unop with 
                              | Uneg -> ce ++ popq rax ++ negq (reg rax)
                              | Unot -> ce ++ popq rax ++ notq (reg rax)
                              ) ++
                              pushq (reg rax)
                            in
                            code
    | PEbinop(binop,lexp1,lexp2)-> let v1 = compile_expr lexp1 env positionAlloc ordreVar ordreMeth in let v2 = compile_expr lexp2 env positionAlloc ordreVar ordreMeth in
                                    let codeLog = (match binop with
                                              | Bor -> (compile_expr (PEif(lexp1, (PEcst(Cbool(true)),dummy_typ), lexp2), dummy_typ) env positionAlloc ordreVar ordreMeth)
                                              | Band -> (compile_expr (PEif(lexp1, lexp2, (PEcst(Cbool(false)),dummy_typ)), dummy_typ) env positionAlloc ordreVar ordreMeth)
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
    | PEif(lcond,lthen,lelse) -> let ccond = compile_expr lcond env positionAlloc ordreVar ordreMeth in let cthen = compile_expr lthen env positionAlloc ordreVar ordreMeth in let celse = compile_expr lelse env positionAlloc ordreVar ordreMeth in
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
    | PEwhile(lexpr, ldo) -> let ccond = compile_expr lexpr env positionAlloc ordreVar ordreMeth in let cdo = compile_expr ldo env positionAlloc ordreVar ordreMeth in
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
    | PEreturn(lexpr_ret) -> let v = compile_expr lexpr_ret env positionAlloc ordreVar ordreMeth in
                            let code =
                                v ++ popq rax ++ popn positionAlloc ++ popq rbp ++ ret
                            in
                            code
    | PEprint(texpr_print) -> let res = compile_expr texpr_print env positionAlloc ordreVar ordreMeth in
                             let code =
                                (* pushn place *)
                                res ++
                                popq rdi ++
                                (* popn place *)
                                (if estInt (snd texpr_print) then
                                    call "print_int"
                                 else
                                    call "print_string" (*on laisse print_int pour debug*)
                                ) ++
                                pushq (imm 0) (* unit *)
                             in
                             code
    | PEbloc(instruction_list) ->
        match instruction_list with
        | [] -> pushq (imm 0)
        | [PIexpr e] -> compile_expr e env positionAlloc ordreVar ordreMeth
        | bidule::reste -> (
                           match bidule with
                             | PIdef(var) -> let (ident,typ,pexpr) = var in let ce = compile_expr (pexpr, typ) env positionAlloc ordreVar ordreMeth in
                                             let env = Smap.add ident positionAlloc env in
                                             let c2 = compile_expr (PEbloc(reste), dummy_typ) env (positionAlloc+8) ordreVar ordreMeth in
                                             let code = 
                                                ce ++
                                                c2 ++
                                                popq rax ++ (*petit hack pour supprimer la variable à la fin du bloc *)
                                                popq rbx ++
                                                pushq (reg rax)
                                             in
                                             code
                             | PIexpr(locd_expr) -> 
                                let cc = compile_expr locd_expr env positionAlloc ordreVar ordreMeth in 
                                let c2 = compile_expr (PEbloc(reste), dummy_typ) env positionAlloc ordreVar ordreMeth in (*normalement c pas env *)
                                cc ++ popq rax ++ c2
                            )
        | _ -> pushq (imm 0)
    | _ -> assert(false)

let rec compileDecl_l classe pdecl_l newFun ordreVar debutConstruct ordreMeth = 
	match pdecl_l with
	| [] -> newFun, ordreVar,debutConstruct
	| a::b -> compileDecl classe a b newFun ordreVar debutConstruct ordreMeth
and compileDecl classe decl reste newFun ordreVar debutConstruct ordreMeth = 
	match decl with
    | PDvar(var) ->
        let (ident, ptyp, pexpr) = var in
        let expr = (pexpr, ptyp) in
	    let ordreVar = Smap.add classe ((Smap.find classe ordreVar)@[ident]) ordreVar in
	    (* TODO : allouer de la place pour l'expression *)
	    let ce = compile_expr expr (Smap.empty) 0 ordreVar ordreMeth in (*le res est en haut de la pile, mettons le dans rbx*)
	    let debutConstruct = debutConstruct ++ ce ++ popq rbx ++ (movq (reg rbx) (ind ~ofs:(8*(List.length (Smap.find classe ordreVar))) r14)) in
	    (*TODO : libérer la place *)
	    compileDecl_l classe reste newFun ordreVar debutConstruct ordreMeth
    | PDmeth(methode) ->
        let (ident, pl, expr) = methode in
		let env,decal = List.fold_left (fun (ev,nxt) x -> Smap.add x nxt ev, nxt+8) (Smap.empty, 24) (getPlNames pl) in
		let fpmax = 0 in (* TODO *)
		let env = Smap.add "this" decal env in
        let ce = compile_expr expr env fpmax ordreVar ordreMeth in
		let code = 
			label ("M_"^classe^"_"^ident) ++
		    pushq (reg rbp) ++
			movq (reg rsp) (reg rbp) ++
			ce ++ popq rax ++
			movq (reg rbp) (reg rsp) ++ popq rbp ++ ret
		in
		let newFun = newFun ++ code in
		compileDecl_l classe reste newFun ordreVar debutConstruct ordreMeth

let normalise map id = 
    if Smap.mem id map then map
    else
    Smap.add id [] map

(*ordreVar contient toutes les variables d'une classe (ie les siennes et celles de ses parents*)

let compile_class (codefun, codedesc, mMeth, ordreMeth, ordreVar) (PClass(ident,pl,(typ_pere, lexprl),pdecl_l)) = 
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
	let debutConstruct = (compileConstruct ident idPere lexprl plnames ((List.length lpere)*8) ordreVar ordreMeth) in
    let newFun,ordreVar,constructFini = compileDecl_l ident pdecl_l codefun ordreVar debutConstruct newOrdreMeth in
	let newFun = constructFini ++ movq (reg rbp) (reg rsp) ++ popq rbp ++ ret ++ newFun in

	newFun, newDesc, mMeth, newOrdreMeth, ordreVar

let compileMain classe ordreVar ordreMeth = 
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

let rec dernier l = match l with
    | [] -> assert(false)
    | [a] -> a
    | a::b -> dernier b

let compile_program (p : (pclas list)) ofile mMeth cmain =
  let codefun, codedesc, _, ordreMeth, ordreVar = List.fold_left compile_class (nop, nop, mMeth, Smap.empty, Smap.empty) (p) in
  let codemain = compileMain (dernier p) ordreVar ordreMeth in
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
        codefun ++
        label "C_AnyRef" ++
        ret
        ;
        
      data =
        fst (List.fold_left (fun (code,nb) x -> label (".str_"^(string_of_int nb)) ++ string x ++ code, nb-1)
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
