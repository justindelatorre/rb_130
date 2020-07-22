=begin
https://launchschool.com/exercises/a0a4a3d4

Write a method that takes a sorted array of integers as an argument, and returns
an array that includes all of the missing integers (in order) between the first
and last elements of the argument.
=end

def missing(arr)
  arr_sorted = arr.sort
  min = arr_sorted.min
  max = arr_sorted.max
  result = []

  (min..max).each do |n|
    result << n if !arr_sorted.include?(n)
  end

  result.sort
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
