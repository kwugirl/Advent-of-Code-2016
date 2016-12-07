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
    valid_test_cases = ["abba[mnop]qrst", "ioxxoj[asdfgh]zxcvbn", "as[as]as[as]abba"]

    valid_test_cases.each do |test_case|
      assert supports_tls? test_case
    end

    invalid_test_cases = ["abcd[bddb]xyyx", "aaaa[qwer]tyui",
      "abba[mnop]qrst[bddb]"]

    invalid_test_cases.each do |test_case|
      assert !supports_tls?(test_case)
    end
  end

  def test_three_character_palindromes
    test_string = "ababcac"
    expected = ["aba","bab","cac"]

    assert_equal expected, three_character_palindromes(test_string)
  end

  def test_corresponding_babs
    test_set = ["aba","bab","cac"]
    expected = ["bab","aba","aca"]

    assert_equal expected, corresponding_babs(test_set)
  end

  def test_supports_ssl?
    valid_cases = ["aba[bab]xyz", "aaa[kek]eke", "zazbz[bzb]cdb"]

    valid_cases.each do |test|
      assert supports_ssl?(test)
    end

    invalid_case = "xyx[xyx]xyx"
    assert !supports_ssl?(invalid_case)
  end
end
