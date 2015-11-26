  
  open Ast
  exception Syntax_error of string
exception Error

type token = 
  | WHILE
  | VAR
  | VAL
  | TYPE_LT
  | TYPE_BT
  | TIMES
  | SEMICOLON
  | RSQ
  | RP
  | RETURN
  | RBRA
  | PRINT
  | PLUS
  | OVERRIDE
  | OBJECT
  | NEW
  | MOD
  | MINUS
  | LSQ
  | LP
  | LOG_OR
  | LOG_AND
  | LBRA
  | IF
  | IDENT of (string)
  | EXTENDS
  | EQUAL
  | EOF
  | ELSE
  | DOT
  | DIV
  | DEF
  | CST of (Ast.constant)
  | COMMA
  | COLON
  | CMP_INEG of (Ast.binop)
  | CMP_EG of (Ast.binop)
  | CLASS
  | BANG

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState176
  | MenhirState170
  | MenhirState165
  | MenhirState160
  | MenhirState156
  | MenhirState154
  | MenhirState152
  | MenhirState146
  | MenhirState144
  | MenhirState141
  | MenhirState138
  | MenhirState135
  | MenhirState131
  | MenhirState122
  | MenhirState110
  | MenhirState102
  | MenhirState100
  | MenhirState96
  | MenhirState91
  | MenhirState88
  | MenhirState86
  | MenhirState84
  | MenhirState82
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState74
  | MenhirState70
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState63
  | MenhirState61
  | MenhirState59
  | MenhirState57
  | MenhirState56
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState50
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState42
  | MenhirState40
  | MenhirState35
  | MenhirState31
  | MenhirState29
  | MenhirState25
  | MenhirState20
  | MenhirState17
  | MenhirState10
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState4
  | MenhirState3
  | MenhirState0

let _eRR =
  Error

let rec _menhir_goto_separated_nonempty_list_COMMA_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.decl list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let x = _v in
        let _v : (Ast.decl list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_decl__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState165 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let xs = _v in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.decl list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_decl_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_SEMICOLON_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.class_Main) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState170 | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let x = _v in
        let _v : (Ast.class_Main) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_decl__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState152 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let xs = _v in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.class_Main) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_SEMICOLON_decl_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_SEMICOLON_instruction_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.instruction list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState141 | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let x = _v in
        let _v : (Ast.instruction list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_instruction__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let xs = _v in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.instruction list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_SEMICOLON_instruction_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.decl) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState170 | MenhirState152 | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | OVERRIDE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | VAL ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | VAR ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | DEF ->
                _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152)
        | RBRA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : (Ast.class_Main) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_SEMICOLON_decl_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState165 | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | OVERRIDE ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | VAL ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | VAR ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | DEF ->
                _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165)
        | RBRA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : (Ast.decl list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_COMMA_decl_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_methode : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.methode) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let m = _v in
    let _v : (Ast.decl) =               ( Dmeth m ) in
    _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_instruction : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.instruction) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMICOLON ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | BANG ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | CST _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | IF ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | LBRA ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | LP ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | NEW ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | PRINT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | RETURN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | VAL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | VAR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | WHILE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110)
    | RBRA | RSQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.instruction list) =     ( [ x ] ) in
        _menhir_goto_separated_nonempty_list_SEMICOLON_instruction_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_var : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.var) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState141 | MenhirState110 | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let va = _v in
        let _v : (Ast.instruction) =             ( Idef  va ) in
        _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
    | MenhirState170 | MenhirState165 | MenhirState160 | MenhirState152 | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let v = _v in
        let _v : (Ast.decl) =               ( Dvar  v ) in
        _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState156 | MenhirState55 | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let x = _v in
        let _v : (Ast.expr list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let xs = _v in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.expr list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run70 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run76 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_run80 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80

and _menhir_run82 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_run84 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84

and _menhir_run72 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _ = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let id = _v in
        let (_menhir_stack, _menhir_s, ex) = _menhir_stack in
        let _v : (Ast.left_value) =                             ( Laccess (ex, id) ) in
        _menhir_goto_left_value _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run78 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_run86 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> (Ast.binop) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86

and _menhir_run88 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> (Ast.binop) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88

and _menhir_goto_loption_separated_nonempty_list_COMMA_decl__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.decl list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _ = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((((_menhir_stack, _menhir_s), name), l0), l1), _, ty), l2), _, xs0) = _menhir_stack in
        let _v : (Ast.clas) = let dl =
          let xs = xs0 in
              ( xs )
        in
        let pt =
          let l = l2 in
                                                                                      (l)
        in
        let pl =
          let l = l1 in
                                                                                      (l)
        in
        let ptcl =
          let l = l0 in
                                                                                      (l)
        in
            ( CLsub  (name, ptcl, pl, (ty,pt), dl) ) in
        _menhir_goto_clas _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, lv), _, ar), _, xs0) = _menhir_stack in
            let _v : (Ast.expr) = let le =
              let xs = xs0 in
                  ( xs )
            in
                ( Ecall (lv, ar, le) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), nt), _, ar), _, xs0) = _menhir_stack in
            let _v : (Ast.expr) = let le =
              let xs = xs0 in
                  ( xs )
            in
                ( Enew  (nt, ar, le) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, xs00) = _menhir_stack in
            let _v : (Ast.expr list) = let x =
              let xs0 = xs00 in
              let x =
                let xs = xs0 in
                    ( xs )
              in
                  ( x )
            in
                ( x ) in
            _menhir_goto_loption_delimited_LP_separated_list_COMMA_expr__RP__ _menhir_env _menhir_stack _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_instruction__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.instruction list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, xs0) = _menhir_stack in
            let _v : (Ast.expr) = let li =
              let xs = xs0 in
                  ( xs )
            in
                ( Ebloc li ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState141 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s, doOv), name), l0), _, xs0), _, xs1) = _menhir_stack in
            let _v : (Ast.methode) = let il =
              let xs = xs1 in
                  ( xs )
            in
            let pl =
              let xs = xs0 in
                  ( xs )
            in
            let ptl =
              let l = l0 in
                                                                                          (l)
            in
                ( Mproc ((doOv <> None), name, ptl, pl, il) ) in
            _menhir_goto_methode _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_left_value : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.left_value) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQUAL ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState67 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | BANG ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | CST _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | IF ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | LBRA ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | LP ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | NEW ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PRINT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | RETURN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | WHILE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
    | LSQ ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | LP ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | CMP_EG _ | CMP_INEG _ | COMMA | DIV | DOT | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, lv) = _menhir_stack in
        let _v : (Ast.expr) =     ( Eaccess lv ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, lv), _), _, ex) = _menhir_stack in
            let _v : (Ast.expr) =     ( Eaffect (lv, ex) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Bmul )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | ELSE | LOG_AND | LOG_OR | MINUS | PLUS | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Badd )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Bmod )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Bdiv )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | ELSE | LOG_AND | LOG_OR | MINUS | PLUS | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Bsub )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | LOG_OR | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Bor  )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | LOG_AND | LOG_OR | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
                          ( Band )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | ELSE | LOG_AND | LOG_OR | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, e1), c0), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
              let c = c0 in
                          ( c )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | COMMA | ELSE | LOG_AND | LOG_OR | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, e1), c0), _, e2) = _menhir_stack in
            let _v : (Ast.expr) = let bo =
              let c = c0 in
                          ( c )
            in
                ( Ebinop (bo, e1, e2) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState156 | MenhirState55 | MenhirState96 | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState96
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96)
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : (Ast.expr list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : (Ast.expr) = let uo =
                          ( Unot )
            in
                ( Eunop (uo,ex) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, cond), _, pos) = _menhir_stack in
            let _v : (Ast.expr) =     ( Eif    (cond, pos, Ebloc []) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, cond), _, pos), _, neg) = _menhir_stack in
            let _v : (Ast.expr) =     ( Eif    (cond, pos, neg) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RBRA | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), id), _, ty), _, e) = _menhir_stack in
            let _v : (Ast.var) =                                               ( Vcst (id, ty, e) ) in
            _menhir_goto_var _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState141 | MenhirState57 | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | RBRA | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, ex) = _menhir_stack in
            let _v : (Ast.instruction) =             ( Iexpr ex ) in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : (Ast.expr) =     ( ex ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : (Ast.expr) = let uo =
                          ( Uneg )
            in
                ( Eunop (uo,ex) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : (Ast.expr) =     ( Eprint ex ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, e) = _menhir_stack in
            let _v : (Ast.expr) =     ( Ereturn e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState122 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | RBRA | RP | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, cond), _, loop) = _menhir_stack in
            let _v : (Ast.expr) =     ( Ewhile (cond, loop) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RBRA | RSQ | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), id), _, ty), _, e) = _menhir_stack in
            let _v : (Ast.var) =                                               ( Vmut (id, ty, e) ) in
            _menhir_goto_var _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LOG_AND ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | LOG_OR ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | RBRA | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s, doOv), name), l0), _, xs0), _, ty), _, ex) = _menhir_stack in
            let _v : (Ast.methode) = let pl =
              let xs = xs0 in
                  ( xs )
            in
            let ptl =
              let l = l0 in
                                                                                          (l)
            in
                ( Mfunc ((doOv <> None), name, ptl, pl, ty, ex) ) in
            _menhir_goto_methode _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_delimited_LP_separated_list_COMMA_expr__RP__ : _menhir_env -> 'ttv_tail -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | OVERRIDE ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | VAL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | VAR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | DEF ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | RBRA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState160 in
            let _v : (Ast.decl list) =     ( [] ) in
            _menhir_goto_loption_separated_nonempty_list_COMMA_decl__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.expr list) =     ( [] ) in
    _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_separated_nonempty_list_COMMA_param_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.param list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState138 | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let x = _v in
        let _v : (Ast.param list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let xs = _v in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.param list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_typ_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.typ list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : (Ast.typ list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_typ_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, x0) = _menhir_stack in
            let _v : (Ast.typ list) = let x =
              let x = x0 in
                  ( x )
            in
                ( x ) in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_clas : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.clas) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLASS ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | OBJECT ->
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176

and _menhir_goto_option_typ_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.typ option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.instruction list) =     ( [] ) in
    _menhir_goto_loption_separated_nonempty_list_SEMICOLON_instruction__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | LP ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | BANG ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CST _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | IF ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LBRA ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LP ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NEW ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PRINT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | RETURN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | WHILE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CMP_EG _ | CMP_INEG _ | COMMA | DIV | DOT | ELSE | LOG_AND | LOG_OR | MINUS | MOD | RBRA | RP | RSQ | SEMICOLON | TIMES ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : (Ast.expr) =     ( Ereturn (Ebloc []) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | LP ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | BANG ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CST _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | IF ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | LBRA ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | LP ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | NEW ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PRINT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | RETURN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | WHILE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | LSQ ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LP ->
            _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | VAL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | VAR ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | RBRA ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | LP ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | BANG ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | CST _v ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | IDENT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | IF ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | LBRA ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | LP ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | NEW ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PRINT ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | RETURN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | WHILE ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let id = _v in
    let _v : (Ast.left_value) =                             ( Lident id ) in
    _menhir_goto_left_value _menhir_env _menhir_stack _menhir_s _v

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.constant) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let c = _v in
    let _v : (Ast.expr) =     ( Ecst c ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | BANG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | CST _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | IDENT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | IF ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | LBRA ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | LP ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | NEW ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | PLUS ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | PRINT ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | RETURN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | WHILE ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66

and _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ : _menhir_env -> 'ttv_tail -> (Ast.param_type list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LP ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
        | RP ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_separated_nonempty_list_COMMA_param_type_class_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.param_type_class list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, x0) = _menhir_stack in
            let _v : (Ast.param_type_class list) = let x =
              let x = x0 in
                  ( x )
            in
                ( x ) in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ _menhir_env _menhir_stack _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : (Ast.param_type_class list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_param_type_class_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.typ list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let l0 = _v in
    let _v : (Ast.args_type) = let r =
      let l = l0 in
                                                                                  (l)
    in
                                          (ArgsType r) in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, nom), _, ar) = _menhir_stack in
        let _v : (Ast.typ) =                              ( (nom, ar) ) in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        (match _menhir_s with
        | MenhirState10 | MenhirState8 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | IDENT _v ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
            | RSQ ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, x) = _menhir_stack in
                let _v : (Ast.typ list) =     ( [ x ] ) in
                _menhir_goto_separated_nonempty_list_COMMA_typ_ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState6 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, id), _, ty) = _menhir_stack in
            let _v : (Ast.param_type) =                               ( PTsmaller (id, ty) ) in
            _menhir_goto_param_type _menhir_env _menhir_stack _menhir_s _v
        | MenhirState17 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, id), _, ty) = _menhir_stack in
            let _v : (Ast.param_type) =                               ( PTbigger  (id, ty) ) in
            _menhir_goto_param_type _menhir_env _menhir_stack _menhir_s _v
        | MenhirState31 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, x0), _, y0) = _menhir_stack in
            let _v : (Ast.param) = let r =
              let y = y0 in
              let x = x0 in
                  ( (x, y) )
            in
                                                    (r) in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | IDENT _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
            | RP ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, x) = _menhir_stack in
                let _v : (Ast.param list) =     ( [ x ] ) in
                _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState59 | MenhirState42 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : (Ast.typ option) =     ( Some x ) in
            _menhir_goto_option_typ_ _menhir_env _menhir_stack _menhir_s _v
        | MenhirState144 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQUAL ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | BANG ->
                    _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | CST _v ->
                    _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
                | IDENT _v ->
                    _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
                | IF ->
                    _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | LBRA ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | LP ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | NEW ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | PLUS ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | PRINT ->
                    _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | RETURN ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | WHILE ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | MenhirState154 ->
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LP ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | BANG ->
                    _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | CST _v ->
                    _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
                | IDENT _v ->
                    _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
                | IF ->
                    _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | LBRA ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | LP ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | NEW ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | PLUS ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | PRINT ->
                    _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | RETURN ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | WHILE ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | RP ->
                    _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState156
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156)
            | LBRA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _v : (Ast.expr list) =     ( [] ) in
                _menhir_goto_loption_delimited_LP_separated_list_COMMA_expr__RP__ _menhir_env _menhir_stack _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            _menhir_fail ())
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | RP ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | BANG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | CST _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
            | IDENT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
            | IF ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | LBRA ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | LP ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | NEW ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | PLUS ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | PRINT ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | RETURN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | WHILE ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | RP ->
                _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_decl__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.class_Main) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), name), l0), l1), _, xs0) = _menhir_stack in
            let _v : (Ast.clas) = let dl =
              let xs = xs0 in
                  ( xs )
            in
            let pl =
              let l = l1 in
                                                                                          (l)
            in
            let ptcl =
              let l = l0 in
                                                                                          (l)
            in
                ( CLroot (name, ptcl, pl, dl) ) in
            _menhir_goto_clas _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, nomMain), _, xs0) = _menhir_stack in
            let _v : (Ast.class_Main) = let dl =
              let xs = xs0 in
                  ( xs )
            in
                ( if nomMain == "Main" then dl else raise (Syntax_error "Your Main object should be named 'Main'. I see you, Jerry, I know what you're trying to do here. You and I know very well what's going to happen next, and we don't want it to happen.") ) in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EOF ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, cl), main) = _menhir_stack in
                let _v : (Ast.file) =     ( (cl,main) ) in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _1 = _v in
                Obj.magic _1
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.typ option) =     ( None ) in
    _menhir_goto_option_typ_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_option_OVERRIDE_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (unit option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | LSQ ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | IDENT _v ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131)
            | LP ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _v : (Ast.param_type list) =     ( [] ) in
                _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ _menhir_env _menhir_stack _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.param list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, xs00) = _menhir_stack in
            let _v : (Ast.param list) = let x =
              let xs0 = xs00 in
              let x =
                let xs = xs0 in
                    ( xs )
              in
                  ( x )
            in
                ( x ) in
            _menhir_goto_loption_delimited_LP_separated_list_COMMA_param__RP__ _menhir_env _menhir_stack _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | COLON ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | IDENT _v ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144)
            | LSQ ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | BANG ->
                    _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | CST _v ->
                    _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
                | IDENT _v ->
                    _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
                | IF ->
                    _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | LBRA ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | LP ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | NEW ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | PLUS ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | PRINT ->
                    _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | RETURN ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | VAL ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | VAR ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | WHILE ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | RSQ ->
                    _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState141
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_param_type_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.param_type list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RSQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _ = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, x0) = _menhir_stack in
            let _v : (Ast.param_type list) = let x =
              let x = x0 in
                  ( x )
            in
                ( x ) in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ _menhir_env _menhir_stack _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : (Ast.param_type list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_param_type_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_param_type_class : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.param_type_class) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | MINUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | PLUS ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25)
    | RSQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : (Ast.param_type_class list) =     ( [ x ] ) in
        _menhir_goto_separated_nonempty_list_COMMA_param_type_class_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.typ list) =     ( [] ) in
    _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.class_Main) =     ( [] ) in
    _menhir_goto_loption_separated_nonempty_list_SEMICOLON_decl__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (unit option) =     ( None ) in
    _menhir_goto_option_OVERRIDE_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | EQUAL ->
            _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
        | EQUAL ->
            _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let x = () in
    let _v : (unit option) =     ( Some x ) in
    _menhir_goto_option_OVERRIDE_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_loption_delimited_LP_separated_list_COMMA_param__RP__ : _menhir_env -> 'ttv_tail -> (Ast.param list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXTENDS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154)
    | LBRA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | OVERRIDE ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | VAL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | VAR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | DEF ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | RBRA ->
            _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.param list) =     ( [] ) in
    _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_param_type : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.param_type) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, pt) = _menhir_stack in
        let _v : (Ast.param_type_class) =                         ( (ModifPlus,  pt) ) in
        _menhir_goto_param_type_class _menhir_env _menhir_stack _menhir_s _v
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, pt) = _menhir_stack in
        let _v : (Ast.param_type_class) =                         ( (ModifMinus, pt) ) in
        _menhir_goto_param_type_class _menhir_env _menhir_stack _menhir_s _v
    | MenhirState3 | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, pt) = _menhir_stack in
        let _v : (Ast.param_type_class) =                         ( (ModifNone,  pt) ) in
        _menhir_goto_param_type_class _menhir_env _menhir_stack _menhir_s _v
    | MenhirState135 | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | IDENT _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135)
        | RSQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : (Ast.param_type list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_COMMA_param_type_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | LSQ ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | COMMA | EQUAL | LBRA | LP | RP | RSQ ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_goto_list_clas_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.clas list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | OBJECT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | IDENT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                (match _tok with
                | LBRA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _tok = _menhir_discard _menhir_env in
                    (match _tok with
                    | OVERRIDE ->
                        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState170
                    | VAL ->
                        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState170
                    | VAR ->
                        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState170
                    | DEF ->
                        _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState170
                    | RBRA ->
                        _menhir_reduce54 _menhir_env (Obj.magic _menhir_stack) MenhirState170
                    | _ ->
                        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                        _menhir_env._menhir_shifted <- (-1);
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170)
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState176 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : (Ast.clas list) =     ( x :: xs ) in
        _menhir_goto_list_clas_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ : _menhir_env -> 'ttv_tail -> (Ast.param_type_class list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LP ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | RP ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29)
    | EXTENDS | LBRA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _v : (Ast.param list) =     ( [] ) in
        _menhir_goto_loption_delimited_LP_separated_list_COMMA_param__RP__ _menhir_env _menhir_stack _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | TYPE_BT ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
    | TYPE_LT ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
    | COMMA | RSQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, id) = _menhir_stack in
        let _v : (Ast.param_type) =                               ( PTsimple   id      ) in
        _menhir_goto_param_type _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_discard : _menhir_env -> token =
  fun _menhir_env ->
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = _menhir_env._menhir_lexer lexbuf in
    _menhir_env._menhir_token <- _tok;
    _menhir_env._menhir_startp <- lexbuf.Lexing.lex_start_p;
    _menhir_env._menhir_endp <- lexbuf.Lexing.lex_curr_p;
    let shifted = Pervasives.(+) _menhir_env._menhir_shifted 1 in
    if Pervasives.(>=) shifted 0 then
      _menhir_env._menhir_shifted <- shifted;
    _tok

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState176 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState165 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState152 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState144 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState141 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState122 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.clas list) =     ( [] ) in
    _menhir_goto_list_clas_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        (match _tok with
        | LSQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _tok = _menhir_discard _menhir_env in
            (match _tok with
            | IDENT _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | MINUS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | PLUS ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3)
        | EXTENDS | LBRA | LP ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _v : (Ast.param_type_class list) =     ( [] ) in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ _menhir_env _menhir_stack _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.file) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_startp = lexbuf.Lexing.lex_start_p;
      _menhir_endp = lexbuf.Lexing.lex_curr_p;
      _menhir_shifted = 4611686018427387903;
      } in
    Obj.magic (let _menhir_stack = () in
    assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLASS ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OBJECT ->
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)



