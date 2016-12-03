require 'minitest/autorun'
require './day_1'

class Day1Test < Minitest::Test

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

  def test_find_destination
    instructions = ["L10", "R10", "R10", "L5"]
    expected_destination = Position.new(0,15)

    assert_equal expected_destination, find_destination(instructions)
  end

  def test_calculate_distance_from_origin
    position = {x: -15, y: 3}

    assert_equal 18, calculate_distance_from_origin(position)
  end

  def test_find_previously_visited
    instructions = ["R8", "R4", "R4", "R8"]
    expected_destination = Position.new(4,0)

    assert_equal expected_destination, find_previously_visited(instructions)
  end
end
