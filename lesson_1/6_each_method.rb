=begin
Link to walk-through:
https://launchschool.com/lessons/c0400a9c/assignments/c7af0c78

Below we try to implement an #each method from scratch.
=end

# Original Implementation
puts "=== ORIGINAL IMPLEMENTATION ==="
[1, 2, 3].each do |num|
  puts num
end

# Provided Implementation
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

# Provided Execution
puts "=== PROVIDED IMPLEMENTATION ==="
each([1, 2, 3]) do |num|
  puts num
end
