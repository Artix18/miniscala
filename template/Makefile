all:
	ocamlopt -o ast ast.mli
	ocamlopt -o past past.mli
	menhir --infer parser.mly
	ocamllex lexer.mll
	rm parser.mli
	ocamlopt -o pscala x86_64.ml parser.ml lexer.ml typage.ml compile.ml main.ml

test:
	for f in tests/typing/good/*.scala; do ./pscala $$f; done
	for f in tests/exec/*.scala; do ./pscala $$f; done

clean :
	rm -rf pscala *.cmo *.cmi *.cmx *~ *.o
	rm parser.ml lexer.ml
