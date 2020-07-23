=begin
https://launchschool.com/exercises/e1183a98

Write a minitest assertion that will fail if value is not nil.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @value = nil
  end

  def test_nil
    assert(@value == nil)
  end
end
