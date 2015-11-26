
# 4 "parser.mly"
  
  open Ast
  exception Syntax_error of string

# 8 "parser.ml"
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
  | IDENT of (
# 12 "parser.mly"
       (string)
# 39 "parser.ml"
)
  | EXTENDS
  | EQUAL
  | EOF
  | ELSE
  | DOT
  | DIV
  | DEF
  | CST of (
# 9 "parser.mly"
       (Ast.constant)
# 51 "parser.ml"
)
  | COMMA
  | COLON
  | CMP_INEG of (
# 11 "parser.mly"
       (Ast.binop)
# 58 "parser.ml"
)
  | CMP_EG of (
# 10 "parser.mly"
       (Ast.binop)
# 63 "parser.ml"
)
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

let rec _menhir_goto_separated_nonempty_list_COMMA_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_decl_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv991 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 148 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_decl_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_COMMA_decl_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_decl__ = 
# 59 "standard.mly"
    ( x )
# 159 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_decl__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv990)) : 'freshtv992)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv995 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 167 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_decl_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_COMMA_decl_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_decl_ = 
# 146 "standard.mly"
    ( x :: xs )
# 179 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_decl_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv994)) : 'freshtv996)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_SEMICOLON_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_decl_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState170 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv983) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_decl_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv981) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_SEMICOLON_decl_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_decl__ = 
# 59 "standard.mly"
    ( x )
# 200 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_decl__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987) * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_decl_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv985 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_SEMICOLON_decl_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_decl_ = 
# 146 "standard.mly"
    ( x :: xs )
# 216 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_decl_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)) : 'freshtv988)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_SEMICOLON_instruction_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_SEMICOLON_instruction_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState141 | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv975) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_instruction_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv973) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_SEMICOLON_instruction_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__ = 
# 59 "standard.mly"
    ( x )
# 237 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_instruction__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv979 * _menhir_state) * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_SEMICOLON_instruction_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv977 * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_SEMICOLON_instruction_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_instruction_ = 
# 146 "standard.mly"
    ( x :: xs )
# 253 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_instruction_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv978)) : 'freshtv980)
    | _ ->
        _menhir_fail ()

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_decl -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState170 | MenhirState152 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv959 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv957 * _menhir_state * 'tv_decl) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv951) * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv949) * _menhir_state * 'tv_decl) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152) : 'freshtv950)) : 'freshtv952)
        | RBRA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv953 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_SEMICOLON_decl_ = 
# 144 "standard.mly"
    ( [ x ] )
# 299 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_decl_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv954)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv955 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv956)) : 'freshtv958)) : 'freshtv960)
    | MenhirState165 | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv971 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv969 * _menhir_state * 'tv_decl) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv963 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 323 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv961 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 330 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_decl) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv962)) : 'freshtv964)
        | RBRA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv965 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_COMMA_decl_ = 
# 144 "standard.mly"
    ( [ x ] )
# 353 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_decl_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv967 * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv968)) : 'freshtv970)) : 'freshtv972)
    | _ ->
        _menhir_fail ()

and _menhir_goto_methode : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_methode -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv947) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_methode) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv945) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (m : 'tv_methode) = _v in
    ((let _v : 'tv_decl = 
# 79 "parser.mly"
              ( Dmeth m )
# 379 "parser.ml"
     in
    _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv946)) : 'freshtv948)

and _menhir_goto_instruction : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_instruction -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv943 * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv941 * _menhir_state * 'tv_instruction) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | SEMICOLON ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv935 * _menhir_state) * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv933 * _menhir_state) * _menhir_state * 'tv_instruction) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv934)) : 'freshtv936)
    | RBRA | RSQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv937 * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_SEMICOLON_instruction_ = 
# 144 "standard.mly"
    ( [ x ] )
# 439 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_instruction_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv938)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv939 * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv940)) : 'freshtv942)) : 'freshtv944)

and _menhir_goto_var : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_var -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState141 | MenhirState110 | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv927) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_var) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv925) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (va : 'tv_var) = _v in
        ((let _v : 'tv_instruction = 
# 156 "parser.mly"
            ( Idef  va )
# 465 "parser.ml"
         in
        _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v) : 'freshtv926)) : 'freshtv928)
    | MenhirState170 | MenhirState165 | MenhirState160 | MenhirState152 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv931) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_var) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv929) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (v : 'tv_var) = _v in
        ((let _v : 'tv_decl = 
# 78 "parser.mly"
              ( Dvar  v )
# 480 "parser.ml"
         in
        _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v) : 'freshtv930)) : 'freshtv932)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState156 | MenhirState55 | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv919) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv917) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_expr__ = 
# 59 "standard.mly"
    ( x )
# 501 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv918)) : 'freshtv920)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv923 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 509 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv921 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_COMMA_expr_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 146 "standard.mly"
    ( x :: xs )
# 521 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv922)) : 'freshtv924)
    | _ ->
        _menhir_fail ()

and _menhir_run70 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv915 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv916)

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv913 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv914)

and _menhir_run76 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv911 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv912)

and _menhir_run80 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv909 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv910)

and _menhir_run82 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv907 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv908)

and _menhir_run84 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv905 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv906)

and _menhir_run72 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv903 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv899 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        let (_v : (
# 12 "parser.mly"
       (string)
# 744 "parser.ml"
        )) = _v in
        ((let _ = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv897 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        let (id : (
# 12 "parser.mly"
       (string)
# 752 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, ex) = _menhir_stack in
        let _v : 'tv_left_value = 
# 161 "parser.mly"
                            ( Laccess (ex, id) )
# 758 "parser.ml"
         in
        _menhir_goto_left_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv898)) : 'freshtv900)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv901 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv902)) : 'freshtv904)

and _menhir_run78 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv895 * _menhir_state * 'tv_expr) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv896)

and _menhir_run86 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> (
# 11 "parser.mly"
       (Ast.binop)
# 806 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv893 * _menhir_state * 'tv_expr) * (
# 11 "parser.mly"
       (Ast.binop)
# 815 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86) : 'freshtv894)

and _menhir_run88 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> (
# 10 "parser.mly"
       (Ast.binop)
# 849 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv891 * _menhir_state * 'tv_expr) * (
# 10 "parser.mly"
       (Ast.binop)
# 858 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv892)

and _menhir_goto_loption_separated_nonempty_list_COMMA_decl__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_decl__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((((('freshtv889 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 896 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_decl__) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((((('freshtv887 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 904 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_decl__) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | RBRA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv883 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 913 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_decl__) = Obj.magic _menhir_stack in
        ((let _ = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv881 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 920 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_decl__) = Obj.magic _menhir_stack in
        ((let (((((((_menhir_stack, _menhir_s), name), l0), l1), _, ty), l2), _, xs0) = _menhir_stack in
        let _v : 'tv_clas = let dl =
          let xs = xs0 in
          
# 135 "standard.mly"
    ( xs )
# 928 "parser.ml"
          
        in
        let pt =
          let l = l2 in
          
# 50 "parser.mly"
                                                                            (l)
# 936 "parser.ml"
          
        in
        let pl =
          let l = l1 in
          
# 50 "parser.mly"
                                                                            (l)
# 944 "parser.ml"
          
        in
        let ptcl =
          let l = l0 in
          
# 53 "parser.mly"
                                                                            (l)
# 952 "parser.ml"
          
        in
        
# 75 "parser.mly"
    ( CLsub  (name, ptcl, pl, (ty,pt), dl) )
# 958 "parser.ml"
         in
        _menhir_goto_clas _menhir_env _menhir_stack _menhir_s _v) : 'freshtv882)) : 'freshtv884)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv885 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 968 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_decl__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv886)) : 'freshtv888)) : 'freshtv890)

and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_expr__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv859 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv857 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv853 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv851 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, lv), _, ar), _, xs0) = _menhir_stack in
            let _v : 'tv_expr = let le =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 998 "parser.ml"
              
            in
            
# 133 "parser.mly"
    ( Ecall (lv, ar, le) )
# 1004 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv852)) : 'freshtv854)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv855 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv856)) : 'freshtv858)) : 'freshtv860)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv869 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1019 "parser.ml"
        )) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv867 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1027 "parser.ml"
        )) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv863 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1036 "parser.ml"
            )) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv861 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1043 "parser.ml"
            )) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), nt), _, ar), _, xs0) = _menhir_stack in
            let _v : 'tv_expr = let le =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 1051 "parser.ml"
              
            in
            
# 135 "parser.mly"
    ( Enew  (nt, ar, le) )
# 1057 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv862)) : 'freshtv864)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv865 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1067 "parser.ml"
            )) * _menhir_state * 'tv_args_type) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv866)) : 'freshtv868)) : 'freshtv870)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv879 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1076 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv877 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1084 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv873 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1093 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv871) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, xs00) = _menhir_stack in
            let _v : 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__ = let x =
              let xs0 = xs00 in
              let x =
                let xs = xs0 in
                
# 135 "standard.mly"
    ( xs )
# 1106 "parser.ml"
                
              in
              
# 103 "standard.mly"
    ( x )
# 1112 "parser.ml"
              
            in
            
# 59 "standard.mly"
    ( x )
# 1118 "parser.ml"
             in
            _menhir_goto_loption_delimited_LP_separated_list_COMMA_expr__RP__ _menhir_env _menhir_stack _v) : 'freshtv872)) : 'freshtv874)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv875 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1128 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_expr__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv876)) : 'freshtv878)) : 'freshtv880)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_instruction__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv839 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv837 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv833 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv831 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, xs0) = _menhir_stack in
            let _v : 'tv_expr = let li =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 1160 "parser.ml"
              
            in
            
# 153 "parser.mly"
    ( Ebloc li )
# 1166 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)) : 'freshtv834)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv835 * _menhir_state) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv836)) : 'freshtv838)) : 'freshtv840)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv849) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 1181 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv847) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 1189 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RSQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv843) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 1198 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv841 * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 1205 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s, doOv), name), l0), _, xs0), _, xs1) = _menhir_stack in
            let _v : 'tv_methode = let il =
              let xs = xs1 in
              
# 135 "standard.mly"
    ( xs )
# 1213 "parser.ml"
              
            in
            let pl =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 1221 "parser.ml"
              
            in
            let ptl =
              let l = l0 in
              
# 53 "parser.mly"
                                                                            (l)
# 1229 "parser.ml"
              
            in
            
# 90 "parser.mly"
    ( Mproc ((doOv <> None), name, ptl, pl, il) )
# 1235 "parser.ml"
             in
            _menhir_goto_methode _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv845) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 1245 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv846)) : 'freshtv848)) : 'freshtv850)
    | _ ->
        _menhir_fail ()

and _menhir_goto_left_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_left_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv829 * _menhir_state * 'tv_left_value) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv827 * _menhir_state * 'tv_left_value) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | EQUAL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823 * _menhir_state * 'tv_left_value) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState67 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv821 * _menhir_state * 'tv_left_value) * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv822)) : 'freshtv824)
    | LSQ ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | LP ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | CMP_EG _ | CMP_INEG _ | COMMA | DIV | DOT | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv825 * _menhir_state * 'tv_left_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, lv) = _menhir_stack in
        let _v : 'tv_expr = 
# 129 "parser.mly"
    ( Eaccess lv )
# 1310 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv828)) : 'freshtv830)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv611 * _menhir_state * 'tv_left_value) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv609 * _menhir_state * 'tv_left_value) * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv605 * _menhir_state * 'tv_left_value) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, lv), _), _, ex) = _menhir_stack in
            let _v : 'tv_expr = 
# 131 "parser.mly"
    ( Eaffect (lv, ex) )
# 1358 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv607 * _menhir_state * 'tv_left_value) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv608)) : 'freshtv610)) : 'freshtv612)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv613 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 166 "parser.mly"
            ( Bmul )
# 1387 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1393 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv615 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv616)) : 'freshtv618)) : 'freshtv620)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv627 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv625 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | ELSE | LOG_AND | LOG_OR | MINUS | PLUS | RBRA | RP | RSQ | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv621 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 164 "parser.mly"
            ( Badd )
# 1428 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1434 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv622)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv623 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv624)) : 'freshtv626)) : 'freshtv628)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv635 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv633 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv629 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 168 "parser.mly"
            ( Bmod )
# 1463 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1469 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv631 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv632)) : 'freshtv634)) : 'freshtv636)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv643 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv641 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv637 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 167 "parser.mly"
            ( Bdiv )
# 1498 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1504 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv639 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv640)) : 'freshtv642)) : 'freshtv644)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | ELSE | LOG_AND | LOG_OR | MINUS | PLUS | RBRA | RP | RSQ | SEMICOLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv645 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 165 "parser.mly"
            ( Bsub )
# 1539 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1545 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv647 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv648)) : 'freshtv650)) : 'freshtv652)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv659 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv657 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv653 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 172 "parser.mly"
            ( Bor  )
# 1590 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1596 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv655 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv656)) : 'freshtv658)) : 'freshtv660)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv665 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv661 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, e1), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              
# 171 "parser.mly"
            ( Band )
# 1639 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1645 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv663 * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv664)) : 'freshtv666)) : 'freshtv668)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv675 * _menhir_state * 'tv_expr) * (
# 11 "parser.mly"
       (Ast.binop)
# 1660 "parser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv673 * _menhir_state * 'tv_expr) * (
# 11 "parser.mly"
       (Ast.binop)
# 1668 "parser.ml"
        )) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv669 * _menhir_state * 'tv_expr) * (
# 11 "parser.mly"
       (Ast.binop)
# 1689 "parser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, e1), c0), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              let c = c0 in
              
# 170 "parser.mly"
            ( c )
# 1697 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1703 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv671 * _menhir_state * 'tv_expr) * (
# 11 "parser.mly"
       (Ast.binop)
# 1713 "parser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv672)) : 'freshtv674)) : 'freshtv676)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv683 * _menhir_state * 'tv_expr) * (
# 10 "parser.mly"
       (Ast.binop)
# 1722 "parser.ml"
        )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv681 * _menhir_state * 'tv_expr) * (
# 10 "parser.mly"
       (Ast.binop)
# 1730 "parser.ml"
        )) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv677 * _menhir_state * 'tv_expr) * (
# 10 "parser.mly"
       (Ast.binop)
# 1753 "parser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, e1), c0), _, e2) = _menhir_stack in
            let _v : 'tv_expr = let bo =
              let c = c0 in
              
# 169 "parser.mly"
            ( c )
# 1761 "parser.ml"
              
            in
            
# 139 "parser.mly"
    ( Ebinop (bo, e1, e2) )
# 1767 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv679 * _menhir_state * 'tv_expr) * (
# 10 "parser.mly"
       (Ast.binop)
# 1777 "parser.ml"
            )) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv680)) : 'freshtv682)) : 'freshtv684)
    | MenhirState156 | MenhirState55 | MenhirState96 | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv693 * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv687 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1799 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv685 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 1806 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv686)) : 'freshtv688)
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv689 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_COMMA_expr_ = 
# 144 "standard.mly"
    ( [ x ] )
# 1859 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv691 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)) : 'freshtv696)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv703 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : 'tv_expr = let uo =
              
# 176 "parser.mly"
            ( Unot )
# 1888 "parser.ml"
              
            in
            
# 137 "parser.mly"
    ( Eunop (uo,ex) )
# 1894 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv698)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv700)) : 'freshtv702)) : 'freshtv704)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv713 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv711 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv707 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv705 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv706)) : 'freshtv708)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv709 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv710)) : 'freshtv712)) : 'freshtv714)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv725 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv723 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | CMP_EG _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) _v
        | CMP_INEG _v ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) _v
        | DIV ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | ELSE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv717 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv715 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv716)) : 'freshtv718)
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv719 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, cond), _, pos) = _menhir_stack in
            let _v : 'tv_expr = 
# 141 "parser.mly"
    ( Eif    (cond, pos, Ebloc []) )
# 2044 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv720)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv721 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv722)) : 'freshtv724)) : 'freshtv726)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv733 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv731 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv727 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, cond), _, pos), _, neg) = _menhir_stack in
            let _v : 'tv_expr = 
# 143 "parser.mly"
    ( Eif    (cond, pos, neg) )
# 2090 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv729 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv730)) : 'freshtv732)) : 'freshtv734)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv741) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2105 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv739) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2113 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv735 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2142 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), id), _, ty), _, e) = _menhir_stack in
            let _v : 'tv_var = 
# 83 "parser.mly"
                                              ( Vcst (id, ty, e) )
# 2148 "parser.ml"
             in
            _menhir_goto_var _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv737) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2158 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv738)) : 'freshtv740)) : 'freshtv742)
    | MenhirState141 | MenhirState57 | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv747 * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv743 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, ex) = _menhir_stack in
            let _v : 'tv_instruction = 
# 157 "parser.mly"
            ( Iexpr ex )
# 2198 "parser.ml"
             in
            _menhir_goto_instruction _menhir_env _menhir_stack _menhir_s _v) : 'freshtv744)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv745 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv746)) : 'freshtv748)) : 'freshtv750)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv759 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv757 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv753 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv751 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : 'tv_expr = 
# 127 "parser.mly"
    ( ex )
# 2245 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)) : 'freshtv754)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv755 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv756)) : 'freshtv758)) : 'freshtv760)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DOT ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | CMP_EG _ | CMP_INEG _ | COMMA | DIV | ELSE | LOG_AND | LOG_OR | MINUS | MOD | PLUS | RBRA | RP | RSQ | SEMICOLON | TIMES ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv761 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : 'tv_expr = let uo =
              
# 175 "parser.mly"
            ( Uneg )
# 2276 "parser.ml"
              
            in
            
# 137 "parser.mly"
    ( Eunop (uo,ex) )
# 2282 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv763 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv764)) : 'freshtv766)) : 'freshtv768)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv777 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv775 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv771 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv769 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, ex) = _menhir_stack in
            let _v : 'tv_expr = 
# 151 "parser.mly"
    ( Eprint ex )
# 2329 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)) : 'freshtv772)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv773 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv774)) : 'freshtv776)) : 'freshtv778)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv779 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, e) = _menhir_stack in
            let _v : 'tv_expr = 
# 149 "parser.mly"
    ( Ereturn e )
# 2377 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv782)) : 'freshtv784)) : 'freshtv786)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv795 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2392 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv793 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2400 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv789 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2427 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv787 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2434 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv788)) : 'freshtv790)
        | TIMES ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv791 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2473 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv792)) : 'freshtv794)) : 'freshtv796)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv803 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2482 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv801 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2490 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv797 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, cond), _, loop) = _menhir_stack in
            let _v : 'tv_expr = 
# 145 "parser.mly"
    ( Ewhile (cond, loop) )
# 2521 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((((('freshtv799 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2531 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv800)) : 'freshtv802)) : 'freshtv804)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv811) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2540 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv809) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2548 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv805 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2577 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), id), _, ty), _, e) = _menhir_stack in
            let _v : 'tv_var = 
# 82 "parser.mly"
                                              ( Vmut (id, ty, e) )
# 2583 "parser.ml"
             in
            _menhir_goto_var _menhir_env _menhir_stack _menhir_s _v) : 'freshtv806)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv807) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2593 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv808)) : 'freshtv810)) : 'freshtv812)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv819) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 2602 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv817) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 2610 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv813 * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 2639 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s, doOv), name), l0), _, xs0), _, ty), _, ex) = _menhir_stack in
            let _v : 'tv_methode = let pl =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 2647 "parser.ml"
              
            in
            let ptl =
              let l = l0 in
              
# 53 "parser.mly"
                                                                            (l)
# 2655 "parser.ml"
              
            in
            
# 95 "parser.mly"
    ( Mfunc ((doOv <> None), name, ptl, pl, ty, ex) )
# 2661 "parser.ml"
             in
            _menhir_goto_methode _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv815) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 2671 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv816)) : 'freshtv818)) : 'freshtv820)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_delimited_LP_separated_list_COMMA_expr__RP__ : _menhir_env -> 'ttv_tail -> 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((((('freshtv603 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2685 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((((('freshtv601 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2693 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LBRA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv597 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2702 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv595 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2709 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | OVERRIDE ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | VAL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | VAR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | DEF ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | RBRA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv593) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState160 in
            ((let _v : 'tv_loption_separated_nonempty_list_COMMA_decl__ = 
# 57 "standard.mly"
    ( [] )
# 2728 "parser.ml"
             in
            _menhir_goto_loption_separated_nonempty_list_COMMA_decl__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv596)) : 'freshtv598)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv599 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2742 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv600)) : 'freshtv602)) : 'freshtv604)

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_loption_separated_nonempty_list_COMMA_expr__ = 
# 57 "standard.mly"
    ( [] )
# 2752 "parser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_separated_nonempty_list_COMMA_param_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_param_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState138 | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv587) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_param_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv585) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (x : 'tv_separated_nonempty_list_COMMA_param_) = _v in
        ((let _v : 'tv_loption_separated_nonempty_list_COMMA_param__ = 
# 59 "standard.mly"
    ( x )
# 2771 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)) : 'freshtv588)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv591 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2779 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_separated_nonempty_list_COMMA_param_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv589 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (xs : 'tv_separated_nonempty_list_COMMA_param_) = _v in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_param_ = 
# 146 "standard.mly"
    ( x :: xs )
# 2791 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv590)) : 'freshtv592)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_typ_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_typ_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv573 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2806 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state * 'tv_typ) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_typ_ = 
# 146 "standard.mly"
    ( x :: xs )
# 2814 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_typ_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)) : 'freshtv574)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv583 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2822 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2830 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RSQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv577 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2839 "parser.ml"
            )) * _menhir_state) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv575 * _menhir_state) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, x0) = _menhir_stack in
            let _v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ = let x =
              let x = x0 in
              
# 103 "standard.mly"
    ( x )
# 2850 "parser.ml"
              
            in
            
# 59 "standard.mly"
    ( x )
# 2856 "parser.ml"
             in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)) : 'freshtv578)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv579 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2866 "parser.ml"
            )) * _menhir_state) * _menhir_state * 'tv_separated_nonempty_list_COMMA_typ_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv580)) : 'freshtv582)) : 'freshtv584)
    | _ ->
        _menhir_fail ()

and _menhir_goto_clas : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_clas -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569 * _menhir_state * 'tv_clas) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567 * _menhir_state * 'tv_clas) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | CLASS ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | OBJECT ->
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv568)) : 'freshtv570)

and _menhir_goto_option_typ_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_typ_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv555) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2902 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv553) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2910 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv549) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2919 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv547) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2926 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv548)) : 'freshtv550)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv551) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2963 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv552)) : 'freshtv554)) : 'freshtv556)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv565) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2972 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv563) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2980 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv559) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2989 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv557) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2996 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv558)) : 'freshtv560)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv561) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3033 "parser.ml"
            )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)) : 'freshtv564)) : 'freshtv566)
    | _ ->
        _menhir_fail ()

and _menhir_reduce56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_instruction__ = 
# 57 "standard.mly"
    ( [] )
# 3045 "parser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_SEMICOLON_instruction__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv545 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv541 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3062 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv539 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3069 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv540)) : 'freshtv542)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv543 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv544)) : 'freshtv546)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv535 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _v : 'tv_expr = 
# 147 "parser.mly"
    ( Ereturn (Ebloc []) )
# 3144 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv538)

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv529 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv527 * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv528)) : 'freshtv530)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv532)) : 'freshtv534)

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv525 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv526)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv523 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 12 "parser.mly"
       (string)
# 3251 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv517 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3259 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LSQ ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LP ->
            _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv518)) : 'freshtv520)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv522)) : 'freshtv524)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv515 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv516)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv513 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv514)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv511 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv507 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv505 * _menhir_state) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv506)) : 'freshtv508)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv510)) : 'freshtv512)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 3408 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv503) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (id : (
# 12 "parser.mly"
       (string)
# 3418 "parser.ml"
    )) = _v in
    ((let _v : 'tv_left_value = 
# 160 "parser.mly"
                            ( Lident id )
# 3423 "parser.ml"
     in
    _menhir_goto_left_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (Ast.constant)
# 3430 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv501) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (c : (
# 9 "parser.mly"
       (Ast.constant)
# 3440 "parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 125 "parser.mly"
    ( Ecst c )
# 3445 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv499 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv500)

and _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ : _menhir_env -> 'ttv_tail -> 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv497) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3491 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv495) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3499 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv491) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3508 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv489) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3515 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
        | RP ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv490)) : 'freshtv492)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv493) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3534 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv494)) : 'freshtv496)) : 'freshtv498)

and _menhir_goto_separated_nonempty_list_COMMA_param_type_class_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_param_type_class_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv483 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3548 "parser.ml"
        )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv481 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3556 "parser.ml"
        )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RSQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv477 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3565 "parser.ml"
            )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv475) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, x0) = _menhir_stack in
            let _v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ = let x =
              let x = x0 in
              
# 103 "standard.mly"
    ( x )
# 3576 "parser.ml"
              
            in
            
# 59 "standard.mly"
    ( x )
# 3582 "parser.ml"
             in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ _menhir_env _menhir_stack _v) : 'freshtv476)) : 'freshtv478)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv479 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3592 "parser.ml"
            )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv487 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3601 "parser.ml"
        )) * _menhir_state * 'tv_param_type_class) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state * 'tv_param_type_class) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_class_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_param_type_class_ = 
# 146 "standard.mly"
    ( x :: xs )
# 3609 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_param_type_class_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv473) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv471) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (l0 : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__) = _v in
    ((let _v : 'tv_args_type = let r =
      let l = l0 in
      
# 53 "parser.mly"
                                                                            (l)
# 3630 "parser.ml"
      
    in
    
# 114 "parser.mly"
                                      (ArgsType r)
# 3636 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv469) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_args_type) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv447 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3649 "parser.ml"
        )) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv445 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3655 "parser.ml"
        )) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, nom), _, ar) = _menhir_stack in
        let _v : 'tv_typ = 
# 111 "parser.mly"
                             ( (nom, ar) )
# 3661 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState10 | MenhirState8 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv389 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv387 * _menhir_state * 'tv_typ) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COMMA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv381 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3683 "parser.ml"
                )) * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv379 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3690 "parser.ml"
                )) * _menhir_state) * _menhir_state * 'tv_typ) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv380)) : 'freshtv382)
            | RSQ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv383 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
                let _v : 'tv_separated_nonempty_list_COMMA_typ_ = 
# 144 "standard.mly"
    ( [ x ] )
# 3707 "parser.ml"
                 in
                _menhir_goto_separated_nonempty_list_COMMA_typ_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)) : 'freshtv388)) : 'freshtv390)
        | MenhirState6 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv393 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3722 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv391 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3728 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, id), _, ty) = _menhir_stack in
            let _v : 'tv_param_type = 
# 102 "parser.mly"
                              ( PTsmaller (id, ty) )
# 3734 "parser.ml"
             in
            _menhir_goto_param_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)) : 'freshtv394)
        | MenhirState17 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv397 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3742 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv395 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3748 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, id), _, ty) = _menhir_stack in
            let _v : 'tv_param_type = 
# 103 "parser.mly"
                              ( PTbigger  (id, ty) )
# 3754 "parser.ml"
             in
            _menhir_goto_param_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)) : 'freshtv398)
        | MenhirState31 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv415 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3762 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3766 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv413 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3772 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, x0), _, y0) = _menhir_stack in
            let _v : 'tv_param = let r =
              let y = y0 in
              let x = x0 in
              
# 78 "standard.mly"
    ( (x, y) )
# 3781 "parser.ml"
              
            in
            
# 98 "parser.mly"
                                        (r)
# 3787 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv411) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_param) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv409 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv407 * _menhir_state * 'tv_param) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COMMA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv401 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3807 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv399 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3814 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_param) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv400)) : 'freshtv402)
            | RP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv403 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
                let _v : 'tv_separated_nonempty_list_COMMA_param_ = 
# 144 "standard.mly"
    ( [ x ] )
# 3831 "parser.ml"
                 in
                _menhir_goto_separated_nonempty_list_COMMA_param_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv405 * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)) : 'freshtv410)) : 'freshtv412)) : 'freshtv414)) : 'freshtv416)
        | MenhirState59 | MenhirState42 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv419 * (
# 12 "parser.mly"
       (string)
# 3846 "parser.ml"
            )) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv417 * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : 'tv_option_typ_ = 
# 31 "standard.mly"
    ( Some x )
# 3854 "parser.ml"
             in
            _menhir_goto_option_typ_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)) : 'freshtv420)
        | MenhirState144 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv429) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3862 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv427) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3870 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | EQUAL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv423) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3879 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv421) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3886 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
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
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv422)) : 'freshtv424)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((((('freshtv425) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 3923 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv426)) : 'freshtv428)) : 'freshtv430)
        | MenhirState154 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv441 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3932 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv439 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3940 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv433 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3949 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv431 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3956 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
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
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv432)) : 'freshtv434)
            | LBRA ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv435) = Obj.magic _menhir_stack in
                ((let _v : 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__ = 
# 57 "standard.mly"
    ( [] )
# 3994 "parser.ml"
                 in
                _menhir_goto_loption_delimited_LP_separated_list_COMMA_expr__RP__ _menhir_env _menhir_stack _v) : 'freshtv436)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv437 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4004 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv438)) : 'freshtv440)) : 'freshtv442)
        | _ ->
            _menhir_fail ()) : 'freshtv444)) : 'freshtv446)) : 'freshtv448)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv457 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4015 "parser.ml"
        )) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv455 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4023 "parser.ml"
        )) * _menhir_state * 'tv_args_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4032 "parser.ml"
            )) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4039 "parser.ml"
            )) * _menhir_state * 'tv_args_type) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv450)) : 'freshtv452)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4078 "parser.ml"
            )) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)) : 'freshtv458)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv467 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv465 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv461 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv459 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv460)) : 'freshtv462)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)) : 'freshtv466)) : 'freshtv468)
    | _ ->
        _menhir_fail ()) : 'freshtv470)) : 'freshtv472)) : 'freshtv474)

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_decl__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_SEMICOLON_decl__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv349 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4146 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv347 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4154 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv343 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4163 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv341 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4170 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), name), l0), l1), _, xs0) = _menhir_stack in
            let _v : 'tv_clas = let dl =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 4178 "parser.ml"
              
            in
            let pl =
              let l = l1 in
              
# 50 "parser.mly"
                                                                            (l)
# 4186 "parser.ml"
              
            in
            let ptcl =
              let l = l0 in
              
# 53 "parser.mly"
                                                                            (l)
# 4194 "parser.ml"
              
            in
            
# 66 "parser.mly"
    ( CLroot (name, ptcl, pl, dl) )
# 4200 "parser.ml"
             in
            _menhir_goto_clas _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)) : 'freshtv344)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv345 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4210 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)) : 'freshtv348)) : 'freshtv350)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv377 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 4219 "parser.ml"
        )) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv375 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 4227 "parser.ml"
        )) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RBRA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 4236 "parser.ml"
            )) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv369) * (
# 12 "parser.mly"
       (string)
# 4243 "parser.ml"
            )) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, nomMain), _, xs0) = _menhir_stack in
            let _v : 'tv_class_Main = let dl =
              let xs = xs0 in
              
# 135 "standard.mly"
    ( xs )
# 4251 "parser.ml"
              
            in
            
# 121 "parser.mly"
    ( if nomMain == "Main" then dl else raise (Syntax_error "Your Main object should be named 'Main'. I see you, Jerry, I know what you're trying to do here. You and I know very well what's going to happen next.") )
# 4257 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv367) = _menhir_stack in
            let (_v : 'tv_class_Main) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365 * _menhir_state * 'tv_list_clas_) * 'tv_class_Main) = Obj.magic _menhir_stack in
            ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            let _tok = _menhir_env._menhir_token in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363 * _menhir_state * 'tv_list_clas_) * 'tv_class_Main) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv359 * _menhir_state * 'tv_list_clas_) * 'tv_class_Main) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv357 * _menhir_state * 'tv_list_clas_) * 'tv_class_Main) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, cl), main) = _menhir_stack in
                let _v : (
# 45 "parser.mly"
      (Ast.file)
# 4280 "parser.ml"
                ) = 
# 57 "parser.mly"
    ( (cl,main) )
# 4284 "parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv355) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : (
# 45 "parser.mly"
      (Ast.file)
# 4292 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : (
# 45 "parser.mly"
      (Ast.file)
# 4300 "parser.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_1 : (
# 45 "parser.mly"
      (Ast.file)
# 4308 "parser.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv352)) : 'freshtv354)) : 'freshtv356)) : 'freshtv358)) : 'freshtv360)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv361 * _menhir_state * 'tv_list_clas_) * 'tv_class_Main) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)) : 'freshtv364)) : 'freshtv366)) : 'freshtv368)) : 'freshtv370)) : 'freshtv372)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 4325 "parser.ml"
            )) * _menhir_state * 'tv_loption_separated_nonempty_list_SEMICOLON_decl__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)) : 'freshtv376)) : 'freshtv378)
    | _ ->
        _menhir_fail ()

and _menhir_reduce62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_typ_ = 
# 29 "standard.mly"
    ( None )
# 4337 "parser.ml"
     in
    _menhir_goto_option_typ_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_option_OVERRIDE_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_OVERRIDE_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_option_OVERRIDE_) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv337 * _menhir_state * 'tv_option_OVERRIDE_) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv333) * _menhir_state * 'tv_option_OVERRIDE_) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331) * _menhir_state * 'tv_option_OVERRIDE_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv327) * _menhir_state * 'tv_option_OVERRIDE_) = Obj.magic _menhir_stack in
            let (_v : (
# 12 "parser.mly"
       (string)
# 4366 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv325) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4374 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | LSQ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv319) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4383 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv317) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4390 "parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv318)) : 'freshtv320)
            | LP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
                ((let _v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ = 
# 57 "standard.mly"
    ( [] )
# 4406 "parser.ml"
                 in
                _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ _menhir_env _menhir_stack _v) : 'freshtv322)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv323) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4416 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)) : 'freshtv326)) : 'freshtv328)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv329) * _menhir_state * 'tv_option_OVERRIDE_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)) : 'freshtv332)) : 'freshtv334)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state * 'tv_option_OVERRIDE_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)) : 'freshtv338)) : 'freshtv340)

and _menhir_goto_loption_separated_nonempty_list_COMMA_param__ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_loption_separated_nonempty_list_COMMA_param__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv295 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4444 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv293 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4452 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv289 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4461 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv287) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, xs00) = _menhir_stack in
            let _v : 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__ = let x =
              let xs0 = xs00 in
              let x =
                let xs = xs0 in
                
# 135 "standard.mly"
    ( xs )
# 4474 "parser.ml"
                
              in
              
# 103 "standard.mly"
    ( x )
# 4480 "parser.ml"
              
            in
            
# 59 "standard.mly"
    ( x )
# 4486 "parser.ml"
             in
            _menhir_goto_loption_delimited_LP_separated_list_COMMA_param__RP__ _menhir_env _menhir_stack _v) : 'freshtv288)) : 'freshtv290)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv291 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4496 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)) : 'freshtv294)) : 'freshtv296)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv315) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4505 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv313) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4513 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv309) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4522 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv307) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4529 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv299) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4538 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv297) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4545 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | IDENT _v ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv298)) : 'freshtv300)
            | LSQ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv303) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4560 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
                ((let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv301) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4567 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
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
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv302)) : 'freshtv304)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv305) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4610 "parser.ml"
                )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)) : 'freshtv310)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv311) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4621 "parser.ml"
            )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)) : 'freshtv314)) : 'freshtv316)
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_param_type_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_separated_nonempty_list_COMMA_param_type_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv281) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4637 "parser.ml"
        )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv279) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4645 "parser.ml"
        )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | RSQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv275) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4654 "parser.ml"
            )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv273) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, x0) = _menhir_stack in
            let _v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ = let x =
              let x = x0 in
              
# 103 "standard.mly"
    ( x )
# 4665 "parser.ml"
              
            in
            
# 59 "standard.mly"
    ( x )
# 4671 "parser.ml"
             in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__ _menhir_env _menhir_stack _v) : 'freshtv274)) : 'freshtv276)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv277) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4681 "parser.ml"
            )) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)) : 'freshtv280)) : 'freshtv282)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv285) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 4690 "parser.ml"
        )) * _menhir_state * 'tv_param_type) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * _menhir_state * 'tv_param_type) * _menhir_state * 'tv_separated_nonempty_list_COMMA_param_type_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_param_type_ = 
# 146 "standard.mly"
    ( x :: xs )
# 4698 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_param_type_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)) : 'freshtv286)
    | _ ->
        _menhir_fail ()

and _menhir_goto_param_type_class : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_param_type_class -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_param_type_class) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_param_type_class) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv263 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4720 "parser.ml"
        )) * _menhir_state * 'tv_param_type_class) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv261 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4727 "parser.ml"
        )) * _menhir_state * 'tv_param_type_class) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | MINUS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | PLUS ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv262)) : 'freshtv264)
    | RSQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state * 'tv_param_type_class) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let _v : 'tv_separated_nonempty_list_COMMA_param_type_class_ = 
# 144 "standard.mly"
    ( [ x ] )
# 4748 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_param_type_class_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_param_type_class) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)) : 'freshtv270)) : 'freshtv272)

and _menhir_reduce46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ = 
# 57 "standard.mly"
    ( [] )
# 4764 "parser.ml"
     in
    _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_typ__RSQ__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv259 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8) : 'freshtv260)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_loption_separated_nonempty_list_SEMICOLON_decl__ = 
# 57 "standard.mly"
    ( [] )
# 4793 "parser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_SEMICOLON_decl__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_OVERRIDE_ = 
# 29 "standard.mly"
    ( None )
# 4802 "parser.ml"
     in
    _menhir_goto_option_OVERRIDE_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv257 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 12 "parser.mly"
       (string)
# 4820 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4828 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | EQUAL ->
            _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv252)) : 'freshtv254)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)) : 'freshtv258)

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv249 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 12 "parser.mly"
       (string)
# 4862 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4870 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
        | EQUAL ->
            _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv244)) : 'freshtv246)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)) : 'freshtv250)

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let x = () in
    let _v : 'tv_option_OVERRIDE_ = 
# 31 "standard.mly"
    ( Some x )
# 4900 "parser.ml"
     in
    _menhir_goto_option_OVERRIDE_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)

and _menhir_goto_loption_delimited_LP_separated_list_COMMA_param__RP__ : _menhir_env -> 'ttv_tail -> 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv239 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4911 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv237 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4919 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | EXTENDS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4928 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv227 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4935 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv228)) : 'freshtv230)
    | LBRA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv233 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4950 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv231 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4957 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv232)) : 'freshtv234)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv235 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 4982 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)) : 'freshtv240)

and _menhir_reduce52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_loption_separated_nonempty_list_COMMA_param__ = 
# 57 "standard.mly"
    ( [] )
# 4992 "parser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_COMMA_param__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 4999 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5008 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | COMMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv221 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5017 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5021 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv219 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5028 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5032 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv220)) : 'freshtv222)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5049 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)

and _menhir_goto_param_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_param_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5063 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state) * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, pt) = _menhir_stack in
        let _v : 'tv_param_type_class = 
# 106 "parser.mly"
                        ( (ModifPlus,  pt) )
# 5071 "parser.ml"
         in
        _menhir_goto_param_type_class _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)) : 'freshtv198)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv201 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5079 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, pt) = _menhir_stack in
        let _v : 'tv_param_type_class = 
# 107 "parser.mly"
                        ( (ModifMinus, pt) )
# 5087 "parser.ml"
         in
        _menhir_goto_param_type_class _menhir_env _menhir_stack _menhir_s _v) : 'freshtv200)) : 'freshtv202)
    | MenhirState3 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, pt) = _menhir_stack in
        let _v : 'tv_param_type_class = 
# 108 "parser.mly"
                        ( (ModifNone,  pt) )
# 5099 "parser.ml"
         in
        _menhir_goto_param_type_class _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)) : 'freshtv206)
    | MenhirState135 | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_param_type) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | COMMA ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv209) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5116 "parser.ml"
            )) * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv207) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5123 "parser.ml"
            )) * _menhir_state * 'tv_param_type) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | IDENT _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv208)) : 'freshtv210)
        | RSQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211 * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, x) = _menhir_stack in
            let _v : 'tv_separated_nonempty_list_COMMA_param_type_ = 
# 144 "standard.mly"
    ( [ x ] )
# 5140 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_param_type_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv213 * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)) : 'freshtv218)
    | _ ->
        _menhir_fail ()

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 5156 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv193 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5165 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LSQ ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | COMMA | EQUAL | LBRA | LP | RP | RSQ ->
        _menhir_reduce46 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv194)

and _menhir_goto_list_clas_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_clas_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_list_clas_) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | OBJECT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv181 * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv179 * _menhir_state * 'tv_list_clas_) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | IDENT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv175 * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
                let (_v : (
# 12 "parser.mly"
       (string)
# 5205 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _tok = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv173 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 5213 "parser.ml"
                )) = _menhir_stack in
                let (_tok : token) = _tok in
                ((match _tok with
                | LBRA ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv169 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 5222 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _tok = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv167 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 5229 "parser.ml"
                    )) = _menhir_stack in
                    let (_tok : token) = _tok in
                    ((match _tok with
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
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv168)) : 'freshtv170)
                | _ ->
                    assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                    _menhir_env._menhir_shifted <- (-1);
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv171 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 5254 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)) : 'freshtv176)
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv177 * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)) : 'freshtv182)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)) : 'freshtv188)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * _menhir_state * 'tv_clas) * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state * 'tv_clas) * _menhir_state * 'tv_list_clas_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, x), _, xs) = _menhir_stack in
        let _v : 'tv_list_clas_ = 
# 116 "standard.mly"
    ( x :: xs )
# 5281 "parser.ml"
         in
        _menhir_goto_list_clas_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv190)) : 'freshtv192)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ : _menhir_env -> 'ttv_tail -> 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv165 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5294 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) = Obj.magic _menhir_stack in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv163 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5302 "parser.ml"
    )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | LP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv157 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5311 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5318 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | RP ->
            _menhir_reduce52 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv156)) : 'freshtv158)
    | EXTENDS | LBRA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159) = Obj.magic _menhir_stack in
        ((let _v : 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__ = 
# 57 "standard.mly"
    ( [] )
# 5336 "parser.ml"
         in
        _menhir_goto_loption_delimited_LP_separated_list_COMMA_param__RP__ _menhir_env _menhir_stack _v) : 'freshtv160)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv161 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5346 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)) : 'freshtv164)) : 'freshtv166)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv154)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv152)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 5384 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5393 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | TYPE_BT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5402 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5409 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv138)) : 'freshtv140)
    | TYPE_LT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5424 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5431 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | IDENT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv142)) : 'freshtv144)
    | COMMA | RSQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5446 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, id) = _menhir_stack in
        let _v : 'tv_param_type = 
# 101 "parser.mly"
                              ( PTsimple   id      )
# 5452 "parser.ml"
         in
        _menhir_goto_param_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5462 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)) : 'freshtv150)

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
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_clas) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * 'tv_list_clas_) * (
# 12 "parser.mly"
       (string)
# 5492 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv25 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5501 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv27 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5510 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * 'tv_loption_delimited_LP_separated_list_COMMA_expr__RP__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv29 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5519 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv31 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5528 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33) * _menhir_state * 'tv_decl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv35) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5542 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv37) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5551 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv39) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5560 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) * _menhir_state * 'tv_loption_separated_nonempty_list_COMMA_param__) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5569 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type__RSQ__) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5578 "parser.ml"
        )) * _menhir_state * 'tv_param_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45) * _menhir_state * 'tv_option_OVERRIDE_) * (
# 12 "parser.mly"
       (string)
# 5587 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv47 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5596 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state) * _menhir_state * 'tv_instruction) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * _menhir_state * 'tv_expr) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv55 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5620 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * 'tv_left_value) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * 'tv_expr) * (
# 10 "parser.mly"
       (Ast.binop)
# 5634 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_expr) * (
# 11 "parser.mly"
       (Ast.binop)
# 5643 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * 'tv_left_value) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state * 'tv_left_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv85) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5707 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5716 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5735 "parser.ml"
        )) * _menhir_state * 'tv_args_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5744 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv103 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5768 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) * _menhir_state * 'tv_typ) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5777 "parser.ml"
        )) * _menhir_state * 'tv_option_typ_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107) * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5786 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5795 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * 'tv_loption_delimited_LP_separated_list_COMMA_param__RP__) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv111 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5804 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * 'tv_param) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5813 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5817 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5826 "parser.ml"
        )) * 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5835 "parser.ml"
        )) * _menhir_state * 'tv_param_type_class) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5849 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5858 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5872 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 5881 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5895 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv136)

and _menhir_reduce36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_clas_ = 
# 114 "standard.mly"
    ( [] )
# 5909 "parser.ml"
     in
    _menhir_goto_list_clas_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | IDENT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 12 "parser.mly"
       (string)
# 5927 "parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _tok = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5935 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | LSQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv7 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5944 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _tok = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5951 "parser.ml"
            )) = _menhir_stack in
            let (_tok : token) = _tok in
            ((match _tok with
            | IDENT _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
            | MINUS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | PLUS ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
            | _ ->
                assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
                _menhir_env._menhir_shifted <- (-1);
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv6)) : 'freshtv8)
        | EXTENDS | LBRA | LP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
            ((let _v : 'tv_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ = 
# 57 "standard.mly"
    ( [] )
# 5971 "parser.ml"
             in
            _menhir_goto_loption_delimited_LSQ_separated_nonempty_list_COMMA_param_type_class__RSQ__ _menhir_env _menhir_stack _v) : 'freshtv10)
        | _ ->
            assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv11 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 5981 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)) : 'freshtv14)) : 'freshtv16)
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 45 "parser.mly"
      (Ast.file)
# 5996 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = lexer lexbuf in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_startp = lexbuf.Lexing.lex_start_p;
        _menhir_endp = lexbuf.Lexing.lex_curr_p;
        _menhir_shifted = 4611686018427387903;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = () in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | CLASS ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OBJECT ->
        _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (Pervasives.(>=) _menhir_env._menhir_shifted 0);
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2)) : 'freshtv4))



