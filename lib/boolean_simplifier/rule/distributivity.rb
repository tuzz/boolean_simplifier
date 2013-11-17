module Distributivity
  def simplify(expr)
    if expr.class == Conjunction
      distribute(expr, Conjunction, Disjunction)
    elsif expr.class == Disjunction
      distribute(expr, Disjunction, Conjunction)
    else
      expr
    end
  end

  private
  def distribute(expr, inner, outer)
    [[0, 1], [1, 0]].each do |a, b|
      if expr.parts[a].class == outer
        return outer.new(
          inner.new(expr.parts[b], expr.parts[a].parts[0]),
          inner.new(expr.parts[b], expr.parts[a].parts[1])
        )
      end
    end
    expr
  end

  extend self
  Rule.collection << self
end
