require 'minitest/autorun'
require './day_9'

class Day9Test < Minitest::Test

  def test_decompress_without_markers
    decompressed = decompress("ADVENT")

    assert_equal "ADVENT", decompressed
    assert_equal 6, decompressed.length
  end

  def test_with_one_marker
    decompressed = decompress("A(1x5)BC")
    expected = "ABBBBBC"

    assert_equal expected, decompressed
    assert_equal 7, decompressed.length
  end

  def test_begin_with_marker
    decompressed = decompress("(3x3)XYZ")
    expected = "XYZXYZXYZ"

    assert_equal expected, decompressed
    assert_equal 9, decompressed.length
  end
end
