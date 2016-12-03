require 'minitest/autorun'
require './day_1a'

class Day1ATest < Minitest::Test

  def test_next_direction_determination
    assert_equal 3, next_direction(0,"L")
    assert_equal 1, next_direction(0,"R")
    assert_equal 2, next_direction(3,"L")
    assert_equal 0, next_direction(3,"R")
  end
end
