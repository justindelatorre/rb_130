=begin
Link to assignment:
https://launchschool.com/lessons/c0400a9c/assignments/c1edc867

Below we try to implement the #reduce method from scratch.
=end

array = [1, 2, 3, 4, 5]

# Original Implementation
puts "=== ORIGINAL IMPLEMENTATION ==="
p array.reduce { |acc, num| acc + num}                # => 15
p array.reduce(10) { |acc, num| acc + num }           # => 25

# Attempted Implementation
def reduce(arr, acc=0)
  sum = acc
  counter = 0

  while counter < arr.size
    element = arr[counter]
    sum = yield(sum, element)
    counter += 1
  end

  sum
end

# Attempted Invocation
puts "=== ATTEMPTED IMPLEMENTATION ==="
p reduce(array) { |acc, num| acc + num }              # => 15
p reduce(array, 10) { |acc, num| acc + num }          # => 25
p reduce(array) { |acc, num| acc + num if num.odd? }  # NoMethodError: undefined method '+' for nil:NilClass
