=begin
https://launchschool.com/exercises/098fba0b

Write a minitest assertion that will fail if the class of value is not Numeric
or one of Numeric's subclasses (e.g., Integer, Float, etc).
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @value = 5
  end

  def test_kind
    assert_kind_of(Numeric, @value)
  end
end
