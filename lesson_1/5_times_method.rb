=begin
Link to walk-through:
https://launchschool.com/lessons/c0400a9c/assignments/cd792c69

The code below attempts to replicate the #times method. 
=end

# Original
puts "=== ORIGINAL ==="
5.times do |num|
  puts num
end

# Provided Implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

# Provided Invocation
puts "=== PROVIDED ==="
times(5) do |num|
  puts num
end
