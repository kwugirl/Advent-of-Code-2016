require 'minitest/autorun'
require './day_4'

class Day4Test < Minitest::Test

  def test_count_letter_frequencies
    str = 'aaaaa-bbb-z-y-x-'
    expected_counts = {'a' => 5, 'b' => 3, 'z' => 1, 'y' => 1, 'x' => 1}

    assert_equal expected_counts, count_letter_frequencies(str)
  end

  def test_group_letters_by_count
    freq = {'a' => 5, 'b' => 3, 'z' => 1, 'y' => 1, 'x' => 1}
    expected_grouping = {5 => 'a', 3 => 'b', 1 => 'xyz'}

    assert_equal expected_grouping, group_letters_by_count(freq)
  end
end
