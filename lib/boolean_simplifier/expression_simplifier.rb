module ExpressionSimplifier
  def simplify(expression)
    return expression unless expression.respond_to?(:parts)

    previous = expression.dup

    expression.parts.each.with_index do |part, index|
      expression.parts[index] = simplify(part)
    end

    Rule.collection.each do |rule|
      expression = rule.simplify(expression)
    end

    if previous == expression
      expression
    else
      simplify(expression)
    end
  end

  extend self
end
