require 'minitest/autorun'
require './day_9'

class Day9Test < Minitest::Test

  def test_decompress_without_markers
    assert_equal "ADVENT", decompress("ADVENT")
  end
end
