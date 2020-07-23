=begin
https://launchschool.com/exercises/d69b88d6

Write a minitest assertion that will fail if value.downcase does not return
'xyz'.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @value = 'XYZ'
  end

  def test_downcase
    assert_equal('xyz', @value.downcase)
  end
end
