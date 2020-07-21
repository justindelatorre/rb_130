=begin
Link to assignment:
https://launchschool.com/lessons/c0400a9c/assignments/5bc68af0

Below we try to implement the #select method from scratch.
=end

# Original Implementation
puts "=== ORIGINAL IMPLEMENTATION ==="
array = [1, 2, 3, 4, 5]

p array.select { |num| num.odd? }
p array.select { |num| puts num }
p array.select { |num| num + 1 }

# Attempted Implementation
def select(arr)
  counter = 0
  new_arr = []

  while counter < arr.size
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end

  new_arr
end

# Attempted Invocation
puts "=== ATTEMPTED IMPLEMENTATION ==="
p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => []
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5]
