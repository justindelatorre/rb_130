=begin
https://launchschool.com/exercises/12b78daf

Write a minitest assertion that will fail if the 'xyz' is not in the Array
list.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @list = ['xyz']
  end

  def test_included
    assert_equal(true, @list.include?('xyz'))
  end
end
