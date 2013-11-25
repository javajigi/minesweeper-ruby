require './helper'

require 'square'

class SquareTest < Test::Unit::TestCase
  def test_open_square
    square = Square.new
    assert_equal(false, square.opened?)
    square.open()
    assert_equal(true, square.opened?)
  end
end