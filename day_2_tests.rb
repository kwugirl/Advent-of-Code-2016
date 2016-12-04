require 'minitest/autorun'
require './day_2'

class Day2Test < Minitest::Test

  def test_determine_next_position
    test_cases = [
      {
        instructions: "ULL",
        starting_position: Position.new(1,1),
        expected_next_position: Position.new(0,0)
      },
      {
        instructions: "RRDDD",
        starting_position: Position.new(0,0),
        expected_next_position: Position.new(2,2)
      },
      {
        instructions: "LURDL",
        starting_position: Position.new(2,2),
        expected_next_position: Position.new(1,2)
      },
      {
        instructions: "UUUUD",
        starting_position: Position.new(1,2),
        expected_next_position: Position.new(1,1)
      }
    ]

    test_cases.each do |test_case|
      result = determine_next_position(test_case[:starting_position], test_case[:instructions])
      assert_equal test_case[:expected_next_position], result
    end
  end

  def test_determine_passcode
    instructions = %w(ULL RRDDD LURDL UUUUD)

    assert_equal "1985", determine_passcode(instructions)
  end
end
