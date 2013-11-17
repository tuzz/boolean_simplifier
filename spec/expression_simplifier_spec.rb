require "spec_helper"

describe ExpressionSimplifier do

  it "simplifies using the rule collection" do
    subject.simplify(
      Conjunction.new("a", "a")
    ).should eq "a"

    subject.simplify(
      Disjunction.new(true, "a")
    ).should eq true

    subject.simplify(
      Conjunction.new(true, "a")
    ).should eq "a"

    subject.simplify(
      Negation.new(Negation.new("a"))
    ).should eq "a"
  end

  it "simplifies until no improvement is made" do
    subject.simplify(
      Negation.new(Negation.new(Negation.new(Negation.new("a"))))
    ).should eq "a"

    subject.simplify(
      Negation.new(Negation.new(Negation.new(Negation.new(Negation.new("a")))))
    ).should eq Negation.new("a")
  end

  it "simplifies constituent parts" do
    double_negation_a = Negation.new(Negation.new("a"))
    double_negation_b = Negation.new(Negation.new("b"))

    subject.simplify(
      Conjunction.new(double_negation_a, double_negation_b)
    ).should eq "a && b"

    subject.simplify(
      Conjunction.new(
        Negation.new(double_negation_a),
        Negation.new(double_negation_b)
      )
    ).should eq Negation.new(Disjunction.new("a", "b"))
  end

end
