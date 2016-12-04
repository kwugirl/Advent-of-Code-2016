require 'minitest/autorun'
require './day_3'

class Day3Test < Minitest::Test

  def test_valid_triangle
    assert !valid_triangle?(5, 10, 25)
  end
end
