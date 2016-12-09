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

  def test_multiple_markers
    decompressed = decompress("A(2x2)BCD(2x2)EFG")
    expected = "ABCBCDEFEFG"

    assert_equal expected, decompressed
    assert_equal 11, decompressed.length
  end

  def test_fake_marker
    decompressed = decompress("(6x1)(1x3)A")
    expected = "(1x3)A"
    assert_equal expected, decompressed
    assert_equal 6, decompressed.length

    decompressed = decompress("X(8x2)(3x3)ABCY")
    expected = "X(3x3)ABC(3x3)ABCY"
    assert_equal expected, decompressed
    assert_equal 18, decompressed.length
  end
end
