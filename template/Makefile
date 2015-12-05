all:
	ocamlopt -o ast ast.mli
	menhir --infer parser.mly
	ocamllex lexer.mll
	rm parser.mli
	ocamlopt -o main parser.ml lexer.ml typage.ml main.ml
	
	for f in tests/typing/bad/*.scala; do ./main $$f; done

clean :
	rm -rf main *.cmo *.cmi *.cmx *~ *.o
	rm parser.ml lexer.ml
