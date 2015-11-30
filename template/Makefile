all:
	ocamlopt -o ast ast.mli
	menhir --infer parser.mly
	ocamllex lexer.mll
	rm parser.mli
	ocamlopt -o main parser.ml lexer.ml main.ml typage.ml
	
	for f in tests/syntax/good/*.scala; do ./main $$f; done

clean :
	rm -rf main *.cmo *.cmi *.cmx *~ *.o
	rm parser.ml lexer.ml
	rm a.out ast
