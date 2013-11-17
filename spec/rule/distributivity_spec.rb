require "spec_helper"

describe Distributivity do

  it "simplifies distributivity" do
    subject.simplify(
      Conjunction.new(
        "x",
        Disjunction.new("y", "z")
      )
    ).should eq Disjunction.new(
      Conjunction.new("x", "y"),
      Conjunction.new("x", "z")
    )

    subject.simplify(
      Disjunction.new(
        "x",
        Conjunction.new("y", "z")
      )
    ).should eq Conjunction.new(
      Disjunction.new("x", "y"),
      Disjunction.new("x", "z")
    )

    some_expr = Negation.new("a")
    subject.simplify(
      Conjunction.new(
        some_expr,
        Disjunction.new("y", "z")
      )
    ).should eq Disjunction.new(
      Conjunction.new(some_expr, "y"),
      Conjunction.new(some_expr, "z")
    )
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").should eq "a"

    some_expr = Negation.new(Negation.new("a"))
    subject.simplify(some_expr).should eq some_expr
  end

end
