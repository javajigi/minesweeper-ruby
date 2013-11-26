require './helper'

require 'square'

class SquareTest < Test::Unit::TestCase
  @square = nil

  def setup
    @square = Square.closed_not_mine
  end

  def test_open_square
    assert_equal(false, @square.opened)
    @square.open()
    assert_equal(true, @square.opened)
  end

  def test_change_to_mine
    assert_equal(false, @square.mined)
    @square.change_to_mine
    assert_equal(true, @square.mined)
  end

  def test_win_when_open_not_mine
    assert(!@square.win?)
    @square.open
    assert(@square.win?)
  end

  def test_win_when_close_mine
    assert(!@square.win?)
    @square.change_to_mine
    assert(@square.win?)
  end

  def test_mark_close
    assert_equal(' ', @square.get_mark)
  end

  def test_mark_open
    @square.open
    assert_equal('0', @square.get_mark)
  end

  def test_put_neighbor_mine
    @square.put_neighbor_mine
    assert_equal(1, @square.size_of_neighbor_mines)
    @square.put_neighbor_mine
    assert_equal(2, @square.size_of_neighbor_mines)
  end
end