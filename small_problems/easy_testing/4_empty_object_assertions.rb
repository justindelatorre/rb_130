=begin
https://launchschool.com/exercises/eaa85d07

Write a minitest assertion that will fail if the Array list is not empty.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @list = []
  end

  def test_array_not_empty
    assert_empty(@list)
  end
end
