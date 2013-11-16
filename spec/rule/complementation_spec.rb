require "spec_helper"

describe Complementation do

  it "simplifies complementations" do
    subject.simplify(
      Conjunction.new("x", Negation.new("x"))
    ).should be_false

    subject.simplify(
      Disjunction.new(Negation.new("y"), "y")
    ).should be_true

    some_expr = Conjunction.new("z", Negation.new("q"))
    subject.simplify(
      Conjunction.new(some_expr, Negation.new(some_expr))
    ).should be_false
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    some_expr = Conjunction.new(Negation.new("x"), Negation.new("x"))
    subject.simplify(some_expr).should eq some_expr
  end

end
