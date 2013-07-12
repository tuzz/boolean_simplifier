module BooleanSimplifier
  def version
    "1.0.0"
  end

  def simplify(string)
    expression = ExpressionParser.parse(string)
    ExpressionSimplifier.simplify(expression).to_s
  end

  extend self
end
