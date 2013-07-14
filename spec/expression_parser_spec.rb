require "spec_helper"

describe ExpressionParser do

  context "when given a valid string" do
    let(:string) { "a && !(b || c)" }

    it "returns an nested expression" do
      subject.parse(string).should eq(
        Conjunction.new(
          "a", Negation.new(Disjunction.new("b", "c"))
        )
      )
    end
  end

  context "when given an invalid string" do
    let(:string) { "lol wut" }

    it "raises a parse error" do
      expect {
        subject.parse(string)
      }.to raise_error(ParseError)
    end
  end

end
