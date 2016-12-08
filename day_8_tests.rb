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
end
