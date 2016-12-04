require 'minitest/autorun'
require './day_2'

class Day2Test < Minitest::Test

  def test_determine_next_position
    instructions = "ULL"
    starting_position = Position.new(1,1)
    expected_next_position = Position.new(0,0)

    assert_equal expected_next_position, determine_next_position(starting_position, instructions)
  end
end
