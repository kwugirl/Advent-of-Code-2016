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

  def test_supports_tls?
    valid_test_cases = ["abba[mnop]qrst", "ioxxoj[asdfgh]zxcvbn"]

    valid_test_cases.each do |test_case|
      assert supports_tls? test_case
    end

    invalid_test_cases = ["abcd[bddb]xyyx", "aaaa[qwer]tyui",
      "abba[mnop]qrst[bddb]"]

    invalid_test_cases.each do |test_case|
      assert !supports_tls?(test_case)
    end
  end
end
