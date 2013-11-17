require "spec_helper"

describe Identity do

  it "simplifies identities" do
    subject.simplify(
      Disjunction.new("x", false)
    ).to_s.should eq "x"

    subject.simplify(
      Conjunction.new(true, "x")
    ).to_s.should eq "x"

    subject.simplify(
      Conjunction.new(Negation.new("x"), true)
    ).should eq Negation.new("x")
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    some_expr = Conjunction.new(Negation.new("x"), "y")
    subject.simplify(some_expr).should eq some_expr
  end

end
