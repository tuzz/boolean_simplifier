require "spec_helper"

describe DoubleNegation do

  it "simplifies double negations" do
    subject.simplify(
      Negation.new(Negation.new("foo"))
    ).to_s.should eq "foo"

    subject.simplify(
      Negation.new(Negation.new(
        Conjunction.new("a", "b")
      ))
    ).to_s.should eq "a && b"

    subject.simplify(
      Negation.new(Negation.new(Negation.new("a")))
    ).to_s.should eq "!a"
  end

  it "doesn't affect other expressions" do
    subject.simplify("a").to_s.should eq "a"

    subject.simplify(
      Negation.new("a")
    ).to_s.should eq "!a"

    subject.simplify(
      Conjunction.new(
        Negation.new(Negation.new("a")),
        "b"
      )
    ).to_s.should eq "!!a && b"
  end

end
