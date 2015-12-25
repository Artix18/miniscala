open X86_64
open Ast
open Format

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

module Smap = Map.Make(String)

type local_env = ident Smap.t

let compile_decl codefun decl =
	assert(false)

let compile_classes (codefun, codedesc) (Class(ident,_,ptcl,pl,(typ_pere, lexprl),pdecl_l)) = 
	assert(false)

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

let alloc_class classe = 
	assert(false)

let alloc_classes cl = 
	List.map alloc_class cl

let alloc_expr env decal exp = 
	assert(false)

let rec alloc_decl_l decl_l (env, decal) = match decl_l with
  | [] -> [],decal
  | p::q -> alloc_decl p (env, decal) q
and alloc_decl decl ((env:(int Smap.t)), decal) nextL = match decl with
  | Dvar(var) -> let (_,ident,_,exp,_) = var in
  				  let nDecal = alloc_expr env decal exp in
  				  let decal = decal + 8 in
  				  let nEnv = Smap.add ident (-decal) env in
  				  let (rDeco, rMax) = alloc_decl_l nextL (nEnv, decal) in
  				  (PDvar(decal))::rDeco, (max nDecal rMax)
  | Dmeth(methode) -> let (over,ident,ptl,pl,typ,locd_expr,interv) = methode in
  					  let nEnv,nxt=List.fold_left (fun (ev,nxt) (id,_)  -> let nxt = nxt + 8 in (Smap.add id nxt ev, nxt)) (env,8) pl
  					  in
  					  let e, fpmax = alloc_expr nEnv 0 locd_expr in
  					  let (rDeco, rMax) = alloc_decl_l nextL (env, decal) in
					  (PDmeth(ident, ptl,fpmax, e))::rDeco, (max rMax fpmax) (*un truc comme ça je pense, peut être sans ptl*)
let alloc_main dl =
	alloc_decl_l dl (Smap.empty, 0)

let alloc p = 
	alloc_classes (fst p), alloc_main (snd p)

let compile_program p ofile =
  let p = alloc p in
  let codefun, codedesc = List.fold_left compile_classes (nop, nop) (fst p) in
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
