;; extends

; (import_clause
;   (identifier) @include.identifier
; )
;
; (named_imports
;   (import_specifier
;     name: (identifier) @include.identifier
;   )
; )

(jsx_attribute
  (jsx_expression
    (member_expression
      (identifier) @variable.object
      (property_identifier) @variable.objectProperty
    )
  )
)

(template_string
  (template_substitution
    (identifier) @variable.templateSubstitution
  )
)

(member_expression
  object: (identifier) @variable.object
  (#set! "priority" 200)
)

(new_expression
  constructor: (identifier) @class.constructor
  (#set! "priority" 200)
)

[ 
 "'"
 "`"
 "\""
] @punctuation.string.delimiter

operator: ("of") @operator.of

(call_expression
  function: (
    member_expression
      object: (member_expression
        property: (property_identifier) @object.property
      )
      property: (property_identifier)
  )
)

(lexical_declaration
  "const"
  (variable_declarator
    name: (identifier) @constant.identifier
    (#set! "priority" 200)
  )
)
