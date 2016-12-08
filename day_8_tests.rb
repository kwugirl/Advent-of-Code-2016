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
end
