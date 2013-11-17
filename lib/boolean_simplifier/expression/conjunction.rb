class Conjunction < Expression

  def initialize(a, b)
    @parts = [a, b]
  end

  def to_s
    a = bracket(parts[0], Disjunction)
    b = bracket(parts[1], Disjunction)

    "#{a} && #{b}"
  end

end
