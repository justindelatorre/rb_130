=begin
https://launchschool.com/exercises/9eed2942

Write a test that will fail if list and the return value of list.process are
different objects.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @list = 'hello world'
  end

  def test_same_obj
    assert_same(@list, @list.process)
  end
end
