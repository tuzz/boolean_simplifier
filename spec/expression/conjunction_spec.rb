require "spec_helper"

describe Conjunction do

  describe "#to_s" do
    it "places brackets around disjunctions" do
      Conjunction.new(
        Disjunction.new("a", "b"),
        "c"
      ).to_s.should eq "(a || b) && c"

      Conjunction.new(
        Negation.new("a"),
        Disjunction.new("b", "b")
      ).to_s.should eq "!a && (b || b)"

      Conjunction.new("a", "a").should eq "a && a"

      Conjunction.new(
        Negation.new("a"), "b"
      ).to_s.should eq "!a && b"

      Conjunction.new(
        Conjunction.new("a", "b"), "c"
      ).to_s.should eq "a && b && c"
    end
  end

  describe "#parts" do
    it "returns an array of 'a' and 'b'" do
      Conjunction.new("a", "b").parts.should == ["a", "b"]
      Conjunction.new("b", "c").parts.should == ["b", "c"]
    end
  end

end
