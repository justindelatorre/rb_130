=begin
https://launchschool.com/exercises/8621919c

write a method that takes an array as an argument. The method should yield the
contents of the array to a block, which should assign your block variables in
such a way that it ignores the first two elements, and groups all remaining
elements as a raptors array.
=end

birds = %w(raven finch hawk eagle)

def types(arr)
  yield(arr)
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end 
