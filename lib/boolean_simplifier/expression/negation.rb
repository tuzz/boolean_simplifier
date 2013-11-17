class Negation < Expression

  def initialize(expression)
    @parts = [expression]
  end

  def to_s
    expr = bracket(parts[0], Conjunction, Disjunction)
    "!#{expr}"
  end

end
