open X86_64
open Ast
open Format

let (genv : (string, unit) Hashtbl.t) = Hashtbl.create 17

module Smap = Map.Make(String)

type local_env = ident Smap.t

let compile_decl codefun decl =
	assert(false)

let compile_classes (codefun, codemain, codedesc) (Class(ident,_,ptcl,pl,(typ_pere, lexprl),decl_l)) = 
	assert(false)

let compile_program p ofile =
  (*let p = alloc p in*)
  let codefun, codemain, codedesc = List.fold_left compile_classes (nop, nop, nop) (fst p) in
  let p =
    { text =
        glabel "main" ++
        movq (reg rsp) (reg rbp) ++
        codemain ++
        movq (imm 0) (reg rax) ++ (* exit *)
        ret ++
        
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
