=begin
https://launchschool.com/exercises/66216db8

Write a minitest assertion that will fail if the value.odd? is not true.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @value = 8
  end

  def test_odd_question
    assert(@value.odd?)
  end
end
