=begin
https://launchschool.com/exercises/f9cb9ad5

Write a method called drop_while that behaves similarly for Arrays. It should
take an Array as an argument, and a block. It should return all the elements of
the Array, except those elements at the beginning of the Array that produce a
truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element,
drop_while should return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #inject, loop,
for, while, or until to iterate through the Array passed in as an argument, but
must not use any other methods that iterate through an Array or any other
collection.
=end

def drop_while(arr)
  idx = 0
  while idx < arr.size && yield(arr[idx])
    idx += 1
  end

  arr[idx..-1]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
