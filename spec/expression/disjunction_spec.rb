require "spec_helper"

describe Disjunction do

  describe "#to_s" do
    it "doesn't place brackets around anything" do
      Disjunction.new(
        Negation.new("a"),
        Conjunction.new("b", "c")
      ).to_s.should eq "!a || b && c"

      Disjunction.new(
        Negation.new(
          Conjunction.new("a", "b")
        ),
        "c"
      ).should eq "!(a && b) || c"
    end
  end

  describe "#parts" do
    it "returns an array of 'a' and 'b'" do
      Disjunction.new("a", "b").parts.should == ["a", "b"]
      Disjunction.new("b", "c").parts.should == ["b", "c"]
    end
  end

end
