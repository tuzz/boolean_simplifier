class Disjunction < Expression

  def initialize(a, b)
    @parts = [a, b]
  end

  def to_s
    parts.join(" || ")
  end

end
