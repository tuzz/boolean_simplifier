require "spec_helper"

describe Expression do
  describe "equality" do
    let(:foo)      { FooExpression.new }
    let(:bar)      { BarExpression.new }
    let(:foo_like) { FooLikeExpression.new }

    it "considers expressions equal if matching strings" do
      foo.should eq foo_like
      foo.should_not eq bar
      bar.should_not eq foo_like
    end
  end
end

class FooExpression < Expression
  def to_s
    "foo"
  end
end

class BarExpression < Expression
  def to_s
    "bar"
  end
end

class FooLikeExpression < Expression
  def to_s
    "foo"
  end
end
