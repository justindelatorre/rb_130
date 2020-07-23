=begin
https://launchschool.com/exercises/12e1e19c

Write a method called each_with_index that behaves similarly for Arrays. It
should take an Array as an argument, and a block. It should yield each element
and an index number to the block. each_with_index should return a reference to
the original Array.

Your method may use #each, #each_with_object, #inject, loop, for, while, or
until to iterate through the Array passed in as an argument, but must not use
any other methods that iterate through an Array or any other collection.
=end

def each_with_index(arr)
  start_idx = 0
  end_idx = arr.size - 1

  (start_idx..end_idx).each { |n| yield(arr[n], n) }

  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

=begin
Output:

0 -> 1
1 -> 3
2 -> 36
true
=end
