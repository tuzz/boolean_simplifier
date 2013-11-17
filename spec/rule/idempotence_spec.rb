require "spec_helper"

describe Idempotence do

  it "simplifies idempotence" do
    subject.simplify(
      Conjunction.new("x", "x")
    ).to_s.should eq "x"

    subject.simplify(
      Disjunction.new("x", "x")
    ).to_s.should eq "x"

    some_expr = Negation.new("x")
    subject.simplify(
      Conjunction.new(some_expr, some_expr)
    ).should eq some_expr
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    some_expr = Conjunction.new(Negation.new("x"), true)
    subject.simplify(some_expr).should eq some_expr
  end

end
