## Coming soon...

## Boolean Simplifier

A hobbyist's attempt to simplify boolean expressions using a recursive, object-oriented strategy.

## Usage

```ruby
puts BooleanSimplifier.simplify("a && a || !!b")
# a || b

puts BooleanSimplifier.simplify("a && !a")
# false

puts BooleanSimplifier.simplify("!a || !b && (true || false)")
# !(a && b)
```

## How it works

The boolean expression is parsed using [treetop](http://treetop.rubyforge.org/) and a nested tree of objects is instantiated.

A simplifier class recursively simplifies its subexpressions and finally itself.

It simplifies itself by applying simplification rules, such as DoubleNegation and DeMorgans.

The base case for the recursion is if the expression is unalatered after trying all simplification rules.
