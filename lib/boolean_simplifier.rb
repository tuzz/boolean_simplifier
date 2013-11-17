require "treetop"
require "polyglot"

require "boolean_simplifier/base"

require "boolean_simplifier/expression_parser"
require "boolean_simplifier/expression_simplifier"

require "boolean_simplifier/grammar/boolean_expression"

require "boolean_simplifier/expression"
require "boolean_simplifier/expression/negation"
require "boolean_simplifier/expression/conjunction"
require "boolean_simplifier/expression/disjunction"

require "boolean_simplifier/rule"
require "boolean_simplifier/rule/double_negation"
require "boolean_simplifier/rule/complementation"
require "boolean_simplifier/rule/identity"
require "boolean_simplifier/rule/annihilator"
require "boolean_simplifier/rule/idempotence"
require "boolean_simplifier/rule/absorbtion"
