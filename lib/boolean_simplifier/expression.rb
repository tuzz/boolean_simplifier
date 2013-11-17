class Expression

  attr_accessor :parts

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    raise NotImplementedError
  end

  private
  def bracket(expression, *classes)
    if classes.include?(expression.class)
      "(#{expression})"
    else
      expression
    end
  end

end
