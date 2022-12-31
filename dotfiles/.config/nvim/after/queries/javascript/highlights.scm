;; extends

(import_clause
  (identifier) @include.identifier
)

(named_imports
  (import_specifier
    name: (identifier) @include.identifier
  )
)

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
