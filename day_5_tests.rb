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

  def test_construct_password
    assert_equal '18f47a30', construct_password('abc')
  end
end
