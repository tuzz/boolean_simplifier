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

The boolean expression is parsed and an object graph is constructed. This graph consists of instances of Negation, Conjunction, Disjunction. It also contains literal strings.

A set of boolean simplification rules is applied to the expression and recursively to its subexpressions. These rules take an arbitrary expression as input and return a new expression if the rule applies. If not, the original expression is returned.

The base case for this recursive algorithm is when no improvement is made to the given expression after iterating through all simplification rules.

## Limitations

Ruby does not implement tail recursion. Therefore, you may run into a SystemStackError when simplifying large expressions.

I haven't figured out every simplification rule, or the most efficient way to apply them. Therefore, you may find that some expressions are only partially simplified.
