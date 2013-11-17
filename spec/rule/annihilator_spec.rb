require "spec_helper"

describe Annihilator do

  it "simplifies annihilators" do
    subject.simplify(
      Conjunction.new("x", false)
    ).should be_false

    subject.simplify(
      Disjunction.new(true, "x")
    ).should be_true

    subject.simplify(
      Conjunction.new(Negation.new("z"), false)
    ).should be_false
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    some_expr = Disjunction.new("x", Negation.new("x"))
    subject.simplify(some_expr).should eq some_expr
  end

end
