require "spec_helper"

describe BooleanSimplifier do

  it "works for the examples in the readme" do
    pending
    BooleanSimplifier.simplify("a && a || !!b").
      should eq "a || b"

    BooleanSimplifier.simplify("a && !a").
      should be_false

    BooleanSimplifier.simplify("!a || !b && (true || false)").
      should eq "a && b"
  end

end
