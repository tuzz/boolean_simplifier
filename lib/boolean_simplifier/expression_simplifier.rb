module ExpressionSimplifier
  def simplify(expression)
    until_no_improvement(expression) do
      simplify_parts(expression)
      simplify_root(expression)
    end
  end

  private
  def until_no_improvement(expression, &block)
    begin
      break if trivial?(expression)
      previous = expression.dup
      expression = yield
    end until previous == expression

    expression
  end

  def simplify_parts(expression)
    expression.parts.each.with_index do |part, index|
      expression.parts[index] = simplify(part)
    end
  end

  def simplify_root(expression)
    Rule.collection.each do |rule|
      expression = rule.simplify(expression)
    end

    expression
  end

  def trivial?(expression)
    !expression.respond_to?(:parts)
  end

  extend self
end
