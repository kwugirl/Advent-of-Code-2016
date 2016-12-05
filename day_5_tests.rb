require 'minitest/autorun'
require './day_5'

class Day5Test < Minitest::Test

  def test_interesting_hash?
    test_cases = ['abc3231929', 'abc5017308', 'abc5278568']

    test_cases.each do |string|
      assert interesting_hash?(hashed_string(string))
    end

    assert !interesting_hash?(hashed_string('abc42'))
  end

  def test_construct_password_in_order
    assert_equal '18f47a30', construct_password_in_order('abc')
  end

  def test_construct_password_with_positioning
    assert_equal '05ace8e3', construct_password_with_positioning('abc')
  end
end
