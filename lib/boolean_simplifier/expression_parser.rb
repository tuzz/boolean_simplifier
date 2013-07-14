module ExpressionParser
  def parse(string)
    parser = BooleanExpressionParser.new

    ast = parser.parse(string)
    if ast.nil?
      raise ParseError, parser.failure_reason
    end

    ast.to_expression
  end

  class ::ParseError < StandardError; end

  extend self
end
