require "spec_helper"

describe DeMorgans do

  it "simplifies De Morgan's" do
    subject.simplify(
      Conjunction.new(
        Negation.new("x"),
        Negation.new("y")
      )
    ).should eq Negation.new(
      Disjunction.new("x", "y")
    )

    subject.simplify(
      Disjunction.new(
        Negation.new("x"),
        Negation.new("y")
      )
    ).should eq Negation.new(
      Conjunction.new("x", "y")
    )

    some_expr = Conjunction.new("a", "b")
    subject.simplify(
      Conjunction.new(
        Negation.new(some_expr),
        Negation.new(true)
      )
    ).should eq Negation.new(
      Disjunction.new(some_expr, true)
    )
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    some_expr = Negation.new("a")
    subject.simplify(some_expr).should eq some_expr
  end

end
