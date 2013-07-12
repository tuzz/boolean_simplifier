module DoubleNegation
  def simplify(expr)
    if negation?(expr) && negation?(expr.parts[0])
      expr.parts[0].parts[0]
    else
      expr
    end
  end

  private
  def negation?(expr)
    expr.class == Negation
  end

  extend self
  Rule.modules << self
end
