require "spec_helper"

describe Negation do

  describe "#to_s" do
    it "places brackets around conjunctions and disjunctions" do
      Negation.new(Conjunction.new("a", "b")).to_s.
        should eq "!(a && b)"

      Negation.new(Disjunction.new("a", "b")).to_s.
        should eq "!(a || b)"

      Negation.new(Negation.new("a")).
        should eq "!!a"

      Negation.new(
        Conjunction.new(
          Negation.new(
            Disjunction.new("a", "b")
          ),
          "b"
        )
      ).to_s.should eq "!(!(a || b) && b)"
    end
  end

  describe "#parts" do
    it "returns an array of 'expression'" do
      Negation.new("a").parts.should == ["a"]
      Negation.new("b").parts.should == ["b"]
    end
  end

end
