=begin
https://launchschool.com/exercises/ec8dd514

Write a method that does the same thing as Range#step, but does not operate on
a range. Instead, your method should take 3 arguments: the starting value, the
ending value, and the step value to be applied to each iteration. Your method
should also take a block to which it will yield (or call) successive iteration
values.
=end

def step(start_val, end_val, step_val)
  acc = start_val
  range = (start_val..end_val)

  range.each do |n|
    if n == acc
      yield(n)
      acc += step_val
    end
  end

  acc
end

step(1, 10, 3) { |value| puts "value = #{value}" }

=begin
Output:

value = 1
value = 4
value = 7
value = 10
=end
