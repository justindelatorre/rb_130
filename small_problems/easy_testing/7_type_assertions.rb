=begin
https://launchschool.com/exercises/92e1ef71

Write a minitest assertion that will fail if value is not an instance of the
Numeric class exactly. value may not be an instance of one of Numeric's
superclasses.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @value = Numeric.new
  end

  def test_type
    assert_instance_of(Numeric, @value)
  end
end
