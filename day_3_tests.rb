require 'minitest/autorun'
require './day_3'

class Day3Test < Minitest::Test

  def test_valid_triangle
    assert !valid_triangle?(5, 10, 25)
  end

  def test_extract_sets_from_columns
    input = [
      %w(101 301 501),
      %w(102 302 502),
      %w(103 303 503)
    ]
    expected_sets = [
      [101, 102, 103],
      [301, 302, 303],
      [501, 502, 503]
    ]

    assert_equal expected_sets, extract_sets_from_columns(input)
  end
end
