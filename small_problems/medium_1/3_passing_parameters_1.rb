=begin
https://launchschool.com/exercises/c7f39d55

Modify the method below so that the display/output of items is moved to a block,
and its implementation is left up to the user of the gather method.
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(arr)
  puts "Let's start gathering food."
  puts "#{yield(arr)}"
  puts "Nice selection of food we have gathered!"
end

gather(items) { items.join(', ') }
