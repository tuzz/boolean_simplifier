module Idempotence
  def simplify(expr)
    if expr.respond_to?(:parts) && expr.parts[0] == expr.parts[1]
      expr.parts[0]
    else
      expr
    end
  end

  extend self
  Rule.collection << self
end
