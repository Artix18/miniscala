all:
	ocamlopt -o ast ast.mli
	menhir --infer parser.mly
	ocamllex lexer.mll
	rm parser.mli
	ocamlopt -o pscala parser.ml lexer.ml typage.ml main.ml
	
	for f in tests/typing/good/*.scala; do ./pscala $$f; done
	for f in tests/exec/*.scala; do ./pscala $$f; done

clean :
	rm -rf main *.cmo *.cmi *.cmx *~ *.o
	rm parser.ml lexer.ml
