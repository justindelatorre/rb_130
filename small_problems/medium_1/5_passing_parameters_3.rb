=begin
https://launchschool.com/exercises/c9181c33
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Method Call 1
puts "---- Example #1 ----"
gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

=begin
Expected Output 1

Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!
=end

# Method Call 2
puts "---- Example #2 ----"
gather(items) do |apples, *produce, wheat|
  puts apples
  puts produce.join(', ')
  puts wheat
end

=begin
Expected Output 2

Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
=end

# Method Call 3
puts "---- Example #3 ----"
gather(items) do |apples, *produce|
  puts apples
  puts produce.join(', ')
end

=begin
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
=end

# Method Call 4
puts "---- Example #4 ----"
gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end
=begin
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end
