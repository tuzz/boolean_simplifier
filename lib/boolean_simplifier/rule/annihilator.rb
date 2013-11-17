module Annihilator
  def simplify(expr)
    if expr.class == Conjunction
      return_x_if_contains_x(expr, false)
    elsif expr.class == Disjunction
      return_x_if_contains_x(expr, true)
    else
      expr
    end
  end

  private
  def return_x_if_contains_x(expr, x)
    if expr.parts[0] == x
      x
    elsif expr.parts[1] == x
      x
    else
      expr
    end
  end

  extend self
  Rule.collection << self
end
