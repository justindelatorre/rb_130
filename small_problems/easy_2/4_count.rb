=begin
https://launchschool.com/exercises/c6c0d9a9

Write a method called count that behaves similarly for an arbitrarily long list
of arguments. It should take 0 or more arguments and a block, and then return
the total number of arguments for which the block returns true.

If the argument list is empty, count should return 0.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.
=end

def count(*args)
  arr = [*args]
  result = []

  arr.each { |n| result << n if yield(n) }

  result.size
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
