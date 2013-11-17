module NegationOfBoolean
  def simplify(expr)
    if expr.class == Negation
      if expr.parts[0] == true
        return false
      elsif expr.parts[0] == false
        return true
      end
    end

    expr
  end

  extend self
  Rule.collection << self
end
