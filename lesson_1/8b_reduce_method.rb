=begin
Link to assignment:
https://launchschool.com/lessons/c0400a9c/assignments/c1edc867

How would you implement this improved default behavior of #reduce?
=end

# Attempted Implementation
def reduce(arr)
  # TODO
end

# Test Cases
reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
