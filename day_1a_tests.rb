require 'minitest/autorun'
require './day_1a'

class Day1ATest < Minitest::Test

  def test_next_direction_determination
    assert_equal 3, next_direction(0,"L")
    assert_equal 1, next_direction(0,"R")
    assert_equal 2, next_direction(3,"L")
    assert_equal 0, next_direction(3,"R")
  end

  def test_next_position
    current_position = {x: 0, y: 0}
    expected_position = {x: -4, y: 0}

    assert_equal expected_position, next_position(current_position,3,4)
  end
end
