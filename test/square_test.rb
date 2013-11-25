require './helper'

require 'square'

class SquareTest < Test::Unit::TestCase
  def test_open_square
    square = Square.new
    assert_equal(false, square.opened?)
    square.open()
    assert_equal(true, square.opened?)
  end

  def test_put_mine
    square = Square.new
    assert_equal(false, square.mine?)
    square.put_mine
    assert_equal(true, square.mine?)
  end

  def test_win_when_open_not_mine
    square = Square.new
    assert(!square.win?)
    square.open
    assert(square.win?)
  end

  def test_win_when_close_mine
    square = Square.new
    assert(!square.win?)
    square.put_mine
    assert(square.win?)
  end

  def test_mark_close
    square = Square.new
    assert_equal(' ', square.get_mark)
  end

  def test_mark_open
    square = Square.new
    square.open
    assert_equal('0', square.get_mark)
    square = Square.new
    square.put_mine
    square.open
    assert_equal('*', square.get_mark)
  end
end