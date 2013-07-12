class Conjunction < Expression
  def initialize(a, b)
    @a, @b = a, b
  end

  def to_s
    a = bracket(@a, Disjunction)
    b = bracket(@b, Disjunction)

    "#{a} && #{b}"
  end

  def parts
    [@a, @b]
  end
end
