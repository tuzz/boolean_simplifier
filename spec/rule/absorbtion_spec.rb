require "spec_helper"

describe Absorbtion do

  it "simplifies absorbtion" do
    subject.simplify(
      Conjunction.new("x", Disjunction.new("y", "x"))
    ).to_s.should eq "x"

    subject.simplify(
      Conjunction.new("x", Disjunction.new("x", "y"))
    ).to_s.should eq "x"

    subject.simplify(
      Disjunction.new("x", Conjunction.new("y", "x"))
    ).to_s.should eq "x"

    subject.simplify(
      Disjunction.new("x", Conjunction.new("x", "y"))
    ).to_s.should eq "x"

    some_expr = Negation.new("x")
    subject.simplify(
      Conjunction.new(some_expr, Disjunction.new(some_expr, "y"))
    ).should eq some_expr
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    some_expr = Negation.new(Conjunction.new("a", false))
    subject.simplify(some_expr).should eq some_expr

    some_expr = Conjunction.new("x", Conjunction.new("y", "x"))
    subject.simplify(some_expr).should eq some_expr
  end

end
