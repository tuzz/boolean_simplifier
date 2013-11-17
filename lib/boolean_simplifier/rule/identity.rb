module Identity
  def simplify(expr)
    if expr.class == Conjunction
      return_part_if_contains_x(expr, true)
    elsif expr.class == Disjunction
      return_part_if_contains_x(expr, false)
    else
      expr
    end
  end

  private
  def return_part_if_contains_x(expr, x)
    if expr.parts[0] == x
      expr.parts[1]
    elsif expr.parts[1] == x
      expr.parts[0]
    else
      expr
    end
  end

  extend self
  Rule.modules << self
end
