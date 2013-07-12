class Negation < Expression
  def initialize(expression)
    @expression = expression
  end

  def to_s
    expr = bracket(@expression, Conjunction, Disjunction)
    "!#{expr}"
  end

  def parts
    [@expression]
  end
end
