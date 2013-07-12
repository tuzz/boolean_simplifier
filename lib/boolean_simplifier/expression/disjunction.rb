class Disjunction < Expression
  def initialize(a, b)
    @a, @b = a, b
  end

  def to_s
    "#@a || #@b"
  end

  def parts
    [@a, @b]
  end
end
