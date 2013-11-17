require "./lib/boolean_simplifier/base"

Gem::Specification.new do |s|
  s.name        = "boolean_simplifier"
  s.version     = BooleanSimplifier.version
  s.summary     = "Boolean Simplifier"
  s.description = "Simplify boolean expressions"
  s.author      = "Chris Patuzzo"
  s.email       = "chris@patuzzo.co.uk"
  s.homepage    = "https://github.com/tuzz/boolean_simplifier"
  s.files       = ["README.md"] + Dir["lib/**/*.*"]

  s.add_dependency "treetop"
  s.add_dependency "polyglot"

  s.add_development_dependency "rspec"
end
