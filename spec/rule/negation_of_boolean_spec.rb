require "spec_helper"

describe NegationOfBoolean do

  it "simplifies negations of booleans" do
    subject.simplify(Negation.new(true)).should be_false
    subject.simplify(Negation.new(false)).should be_true
  end

  it "does not affect other expressions" do
    subject.simplify("a").should eq "a"

    some_expr = Conjunction.new("a", true)
    subject.simplify(some_expr).should eq some_expr
  end

end
