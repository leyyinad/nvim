;; extends

; ((encapsed_string (string_content) @injection.content)
;  (#match? @injection.content
;   "^\[\s\r]\*SELECT|select|RELACE|replace|INSERT|insert|UPDATE|update|DELETE|delete|CREATE|create|ALTER|alter|DROP|drop|EXPLAIN|explain|TRUNCATE|truncate|BEGIN|begin")
;  (#set! injection.language "sql")
;  (#set! injection.include-children))

([
  (string_content)
  (heredoc_body)
  (nowdoc_body)
 ] @injection.content
 (#any-match? @injection.content
  "^[ \n\r\t\s]\*SELECT|select|RELACE|replace|INSERT|insert|UPDATE|update|DELETE|delete|CREATE|create|ALTER|alter|DROP|drop|EXPLAIN|explain|TRUNCATE|truncate|BEGIN|begin")
 (#set! injection.language "sql")
 (#set! injection.include-children))

((function_call_expression
  function: (_) @_func_identifier
  arguments: (arguments . (argument (_ (string_content) @injection.content))))
  (#set! injection.language "printf")
  (#any-of? @_func_identifier "sprintf" "printf" "vprintf" "vsprintf"))

((function_call_expression
  function: (_) @_func_identifier
  arguments: (arguments (_) . (argument (_ (string_content) @injection.content))))
  (#set! injection.language "printf")
  (#any-of? @_func_identifier "fprintf" "fscanf" "sscanf"))
