require 'minitest/autorun'
require './day_6'

class Day6Test < Minitest::Test

  def test_derive_correct_password
    input = %w(eedadn
              drvtee
              eandsr
              raavrd
              atevrs
              tsrnev
              sdttsa
              rasrtv
              nssdts
              ntnada
              svetve
              tesnvt
              vntsnd
              vrdear
              dvrsen
              enarar)

    assert_equal "easter", derive_correct_password(input)
  end
end
