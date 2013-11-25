require 'test/unit'

require 'grid'

class GridTest < Test::Unit::TestCase
  def setup
    @grid = Grid.new(2, 2)
  end

  def test_initialize
    assert_equal(2, @grid.size_of_row)
    assert_equal(2, @grid.size_of_column)

    assert_equal(Square.closed_not_mine, @grid.get_square(0, 0))
  end

  def test_win_all_open
    @grid.open_square(0, 0)
    assert(@grid.win)
  end

  def test_set_mine
    @grid.set_mine(0, 0)
    assert_equal(Square.closed_mine, @grid.get_square(0, 0))
  end
end