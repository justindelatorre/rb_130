=begin
https://launchschool.com/exercises/82b73047

Write a minitest assertion that will fail unless employee.hire raises a
NoExperienceError exception.
=end

require 'minitest/autorun'

class SampleTest < MiniTest::Test
  def setup
    @hire = nil
  end

  def test_exception
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end
end
