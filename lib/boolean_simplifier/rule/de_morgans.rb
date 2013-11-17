module DeMorgans
  def simplify(expr)
    if expr.class == Conjunction
      apply_de_morgans(expr, Disjunction)
    elsif expr.class == Disjunction
      apply_de_morgans(expr, Conjunction)
    else
      expr
    end
  end

  private
  def apply_de_morgans(expr, inner_class)
    if both_negation?(expr)
      Negation.new(
        inner_class.new(
          expr.parts[0].parts[0],
          expr.parts[1].parts[0])
      )
    else
      expr
    end
  end

  def both_negation?(expr)
    [0, 1].all? { |i| expr.parts[i].class == Negation }
  end

  extend self
  Rule.collection << self
end
