require "spec_helper"

describe BooleanExpressionParser do

  describe "booleans" do
    it "matches true and false" do
      subject.parse("true").to_expression.
        should be_true

      subject.parse("false").to_expression.
        should be_false
    end
  end

  describe "variables" do
    it "matches characters, numbers and underscores" do
      subject.parse("foo").to_expression.
        should eq "foo"

      subject.parse("123").to_expression.
        should eq "123"

      subject.parse("Testing123").to_expression.
        should eq "Testing123"

      subject.parse("_a_0_b_").to_expression.
        should eq "_a_0_b_"
    end
  end

  describe "negatives" do
    it "matches negations" do
      subject.parse("!a").to_expression.
        should eq Negation.new("a")

      subject.parse("!false").to_expression.
        should eq Negation.new(false)
    end

    it "can handle multiple negations" do
      subject.parse("!!a").to_expression.
        should eq Negation.new(Negation.new("a"))
    end
  end

  describe "conjunctives" do
    it "matches conjunctions" do
      subject.parse("a && b").to_expression.
        should eq Conjunction.new("a", "b")

      subject.parse("true&&foo").to_expression.
        should eq Conjunction.new(true, "foo")

      subject.parse("!a && false").to_expression.
        should eq Conjunction.new(Negation.new("a"), false)
    end

    it "can handle multiple conjunctions" do
      subject.parse("a && _b && c").to_expression.
        should eq Conjunction.new("a", Conjunction.new("_b", "c"))
    end
  end

  describe "disjunctives" do
    it "matches disjunctions" do
      subject.parse("a || b").to_expression.
        should eq Disjunction.new("a", "b")

      subject.parse("true || false").to_expression.
        should eq Disjunction.new(true, false)
    end

    it "can handle multiple disjunctions" do
      subject.parse("a || b ||c").to_expression.
        should eq Disjunction.new("a", Disjunction.new("b", "c"))
    end
  end

  describe "parentheses" do
    it "respects the higher precedence" do
      subject.parse("a && (b||c)").to_expression.
        should eq Conjunction.new("a", Disjunction.new("b", "c"))

      subject.parse("!(A__ && true)").to_expression.
        should eq Negation.new(Conjunction.new("A__", true))
    end

    it "can handle multiple parentheses" do
      subject.parse("(((a)))").to_expression.
        should eq "a"

      subject.parse("!(a &&(b || c))").to_expression.
        should eq Negation.new(
          Conjunction.new("a", Disjunction.new("b", "c"))
        )
    end
  end

  describe "whitespace" do
    it "is unaffected by leading and trailing whitespace" do
      subject.parse(" a").to_expression.
        should eq "a"

      subject.parse("true  ").to_expression.
        should eq true
    end
  end

end
