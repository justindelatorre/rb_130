=begin
https://launchschool.com/exercises/7c6be14d

Write your own version of zip that does the same type of operation. It should
take two Arrays as arguments, and return a new Array (the original Arrays should
not be changed). Do not use the built-in Array#zip method. You may assume that
both input arrays have the same number of elements.
=end

def zip(arr1, arr2)
  result = []

  0.upto(arr1.size - 1) do |idx|
    result << [arr1[idx], arr2[idx]]
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
