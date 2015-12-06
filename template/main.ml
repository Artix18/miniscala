
(* Programme principal *)

open Format
open Lexing
open Parser
open Typage

let usage = "usage: mini-scala [options] file.scala"

let parse_only = ref false

let spec =
  [
    "--parse-only", Arg.Set parse_only, "  stop after parsing";
  ]

let file =
  let file = ref None in
  let set_file s =
    if not (Filename.check_suffix s ".scala") then
      raise (Arg.Bad "no .scala extension");
    file := Some s
  in
  Arg.parse spec set_file usage;
  match !file with Some f -> f | None -> Arg.usage spec usage; exit 1

let report (b,e) =
  let l = b.pos_lnum in
  let fc = b.pos_cnum - b.pos_bol + 1 in
  let lc = e.pos_cnum - b.pos_bol + 1 in
  eprintf "File \"%s\", line %d, characters %d-%d:\n" file l fc lc

let () =
  let c = open_in file in
  let lb = Lexing.from_channel c in
  try
    let f = Parser.file Lexer.next_token lb in
    close_in c;
    if !parse_only then exit 0;
    typeFichier f;
    print_string "Typage reussi.";
    print_newline()
  with
    | Lexer.Lexing_error s ->
	    report (lexeme_start_p lb, lexeme_end_p lb);
	    eprintf "lexical error: %s@." s;
	    exit 1
	| Syntax_error s -> 
	    eprintf "custom syntax error: %s@." s;
	    exit 1
    | Parser.Error ->
	    report (lexeme_start_p lb, lexeme_end_p lb);
	    eprintf "syntax error@.";
	    exit 1
	| Param_error (s, interv) ->
	    report interv;
	    eprintf "parameter list error: %s@." s;
	    exit 1
	| Unbound_error (s, interv) ->
	    report interv;
	    eprintf "unbound name error: %s@." s;
	    exit 1
	| Type_error (s, interv) ->
	    report interv;
	    eprintf "type error: %s@." s;
	    exit 1
	| Return_error (s, interv) ->
	    report interv;
	    eprintf "return error: %s@." s;
	    exit 1
	| Unicity_error (s, interv) ->
	    report interv;
	    eprintf "unicity error: %s@." s;
	    exit 1
    | e ->
	    eprintf "Anomaly: %s\n@." (Printexc.to_string e);
	    exit 2



