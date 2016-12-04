require 'minitest/autorun'
require './day_4'

class Day4Test < Minitest::Test

  def test_count_letter_frequencies
    str = 'aaaaa-bbb-z-y-x-'
    expected_counts = {'a' => 5, 'b' => 3, 'z' => 1, 'y' => 1, 'x' => 1}

    assert_equal expected_counts, count_letter_frequencies(str)
  end

  def test_group_letters_by_count
    freq = {'a' => 5, 'b' => 3, 'z' => 1, 'y' => 1, 'x' => 1}
    expected_grouping = {5 => 'a', 3 => 'b', 1 => 'xyz'}

    assert_equal expected_grouping, group_letters_by_count(freq)
  end

  def test_checksum_for_name
    test_cases = [
      {
        name: 'aaaaa-bbb-z-y-x-',
        expected_checksum: 'abxyz'
      },
      {
        name: 'a-b-c-d-e-f-g-h-',
        expected_checksum: 'abcde'
      },
      {
        name: 'not-a-real-room-',
        expected_checksum: 'oarel'
      }
    ]

    test_cases.each do |test_case|
      assert_equal test_case[:expected_checksum], checksum_for_name(test_case[:name])
    end
  end

  def test_real?
    test_cases = [
      {
        name: 'aaaaa-bbb-z-y-x-',
        checksum: 'abxyz',
        expected_result: true
      },
      {
        name: 'totally-real-room-',
        checksum: 'decoy',
        expected_result: false
      }
    ]

    test_cases.each do |test_case|
      assert_equal test_case[:expected_result], real_room?(test_case[:name], test_case[:checksum])
    end
  end

  def test_decrypted_name
    encrypted_name = 'qzmt-zixmtkozy-ivhz'
    expected_decrypted_name = 'very encrypted name'

    assert_equal expected_decrypted_name, decrypted_name(encrypted_name, 343)
  end
end
