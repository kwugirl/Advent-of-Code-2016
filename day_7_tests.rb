require 'minitest/autorun'
require './day_7'

class Day7Test < Minitest::Test

  def test_has_abba?
    valid_test_cases = ["abba", "ioxxojk"]

    valid_test_cases.each do |test_case|
      assert has_an_abba? test_case
    end

    invalid_test_case = "aaaa"
    assert !has_an_abba?(invalid_test_case)
  end
end
