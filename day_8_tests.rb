require 'minitest/autorun'
require './day_8'

class Day8Test < Minitest::Test

  def test_rect
    starting_screen = create_screen(7,3)
    expected = [
      ["#","#","#",".",".",".","."],
      ["#","#","#",".",".",".","."],
      [".",".",".",".",".",".","."]
    ]

    assert_equal expected, rect(3, 2, starting_screen)
  end

  def test_rotate_row
    starting_screen = [
      ["#",".","#",".",".",".","."],
      ["#","#","#",".",".",".","."],
      [".","#",".",".",".",".","."]
    ]
    expected = [
      [".",".",".",".","#",".","#"],
      ["#","#","#",".",".",".","."],
      [".","#",".",".",".",".","."]
    ]

    assert_equal expected, rotate_row(0, 4, starting_screen)
  end

  def test_rotate_column
    test_cases = [
      {
        starting_screen: [
          ["#","#","#",".",".",".","."],
          ["#","#","#",".",".",".","."],
          [".",".",".",".",".",".","."]
        ],
        a: 1,
        b: 1,
        expected: [
          ["#",".","#",".",".",".","."],
          ["#","#","#",".",".",".","."],
          [".","#",".",".",".",".","."]
        ]
      },
      {
        starting_screen: [
          [".",".",".",".","#",".","#"],
          ["#","#","#",".",".",".","."],
          [".","#",".",".",".",".","."]
        ],
        a: 1,
        b: 1,
        expected: [
          [".","#",".",".","#",".","#"],
          ["#",".","#",".",".",".","."],
          [".","#",".",".",".",".","."]
        ]
      }
    ]

    test_cases.each do |ex|
      assert_equal ex[:expected], rotate_column(ex[:a], ex[:b], ex[:starting_screen])
    end
  end

  def test_parse_instructions
    test_cases = [
      {
        line: "rect 1x1",
        expected: {
          command: :rect,
          a: 1,
          b: 1
        }
      },
      {
        line: "rotate row y=0 by 2",
        expected: {
          command: :rotate_row,
          a: 0,
          b: 2
        }
      },
      {
        line: "rotate column x=32 by 1",
        expected: {
          command: :rotate_column,
          a: 32,
          b: 1
        }
      }
    ]

    test_cases.each do |ex|
      assert_equal ex[:expected], parse_instruction(ex[:line])
    end
  end
end
