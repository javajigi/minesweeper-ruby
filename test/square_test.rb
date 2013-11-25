require './helper'

require 'square'

class SquareTest < Test::Unit::TestCase
  @square = nil

  def setup
    @square = Square.closed_not_mine
  end

  def test_open_square
    assert_equal(false, @square.opened?)
    @square.open()
    assert_equal(true, @square.opened?)
  end

  def test_put_mine
    assert_equal(false, @square.mine?)
    @square.put_mine
    assert_equal(true, @square.mine?)
  end

  def test_win_when_open_not_mine
    assert(!@square.win?)
    @square.open
    assert(@square.win?)
  end

  def test_win_when_close_mine
    assert(!@square.win?)
    @square.put_mine
    assert(@square.win?)
  end

  def test_mark_close
    assert_equal(' ', @square.get_mark)
  end

  def test_mark_open
    @square.open
    assert_equal('0', @square.get_mark)

    @square = Square.closed_not_mine
    @square.put_mine
    @square.open
    assert_equal('*', @square.get_mark)
  end
end