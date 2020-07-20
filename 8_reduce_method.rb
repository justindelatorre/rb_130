=begin
Link to assignment:
https://launchschool.com/lessons/c0400a9c/assignments/c1edc867

Below we try to implement the #reduce method from scratch.
=end

array = [1, 2, 3, 4, 5]

# Original Implementation
array.reduce { |acc, num| acc + num}
array.reduce(10) { |acc, num| acc + num }

# Attempted Implementation
# TODO

# Attempted Invocation
reduce(array) { |acc, num| acc + num }              # => 15
reduce(array, 10) { |acc, num| acc + num }          # => 25
reduce(array) { |acc, num| acc + num if num.odd? }  # NoMethodError: undefined method '+' for nil:NilClass
