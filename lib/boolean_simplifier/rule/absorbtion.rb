module Absorbtion
  def simplify(expr)
    if expr.class == Conjunction
      absorb_for_class(expr, Disjunction)
    elsif expr.class == Disjunction
      absorb_for_class(expr, Conjunction)
    else
      expr
    end
  end

  private
  def absorb_for_class(expr, klass)
    [[0, 1], [1, 0]].each do |a, b|
      if expr.parts[a].class == klass && contains?(expr.parts[a], expr.parts[b])
        return expr.parts[b]
      end
    end
    expr
  end

  def contains?(a, b)
    a.parts[0] == b || a.parts[1] == b
  end

  extend self
  Rule.modules << self
end
