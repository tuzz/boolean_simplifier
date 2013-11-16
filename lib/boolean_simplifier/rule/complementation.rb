module Complementation
  def simplify(expr)
    if expr.class == Conjunction
      return_x_if_complementary(expr, false)
    elsif expr.class == Disjunction
      return_x_if_complementary(expr, true)
    else
      expr
    end
  end

  private
  def return_x_if_complementary(expr, x)
    complementary_expressions?(expr) ? x : expr
  end

  def complementary_expressions?(expr)
    [[0, 1], [1, 0]].any? do |a, b|
      expr.parts[a] == Negation.new(expr.parts[b])
    end
  end

  extend self
  Rule.modules << self
end
