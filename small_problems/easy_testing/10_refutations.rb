=begin
https://launchschool.com/exercises/4ac8e502

Write a test that will fail if 'xyz' is one of the elements in the Array list.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @list = ['abc']
  end

  def test_refute
    refute_equal(true, @list.include?('xyz'))
  end
end
